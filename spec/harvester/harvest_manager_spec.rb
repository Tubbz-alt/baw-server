require 'spec_helper'
require 'modules/exceptions'
require 'external/harvester/harvest_manager'

include Warden::Test::Helpers
Warden.test_mode!

describe Harvester::Manager do
  context 'running the harvester' do

    before(:each) do
      @permission = FactoryGirl.create(:read_permission)
      @harvester = FactoryGirl.create(:harvester)
      login_as @harvester, scope: :harvester
    end

    it 'works as intended' do

      auth_token = SecureRandom.urlsafe_base64(nil, false)

      # TODO: check state before and after stubbed requests
      # TODO: split harvesting a single file from monitoring file changes
      # TODO: harvester should check that an entry for the audio recording does not already exist (using hash + original file name)
      # TODO: audio recording states: new, uploading, to_check, ready, corrupt, aborted


      WebMock.after_request do |request_signature, response|
        puts "Request #{request_signature} was made and #{response} was returned"
      end

      # 1. log in
      login_stub = stub_request(:post, 'http://localhost:3030/security/sign_in')
      .with(body: '{"email":"address@example.com","password":"password"}')
      .to_return(body: '{"success":true,"auth_token":"'+auth_token+'","email":"address@example.com"}')

      # no changes

      # for each directory
      # 2. Check uploader id
      uploader_id_stub = stub_request(:get, 'http://localhost:3030/projects/1/sites/1/audio_recordings/check_uploader/1')
      .to_return(body: '', status: 204)
      # no changes

      # file hash to generated by harvester - takes time
      # 3. create audio recording on server - "new"
      # validates the audio recording model
      create_stub = stub_request(:post, 'localhost:3030/projects/1/sites/1/audio_recordings')
      .to_return(status: 201, body: {
          bit_rate_bps: 93974,
          channels: 1,
          created_at: "2014-02-07T18:49:54+10:00",
          creator_id: 1,
          data_length_bytes: 822281,
          deleted_at: nil,
          deleter_id: nil,
          duration_seconds: 70.0,
          file_hash: "SHA256::c110884206d25a83dd6d4c741861c429c10f99df9102863dde772f149387d891",
          id: 240042,
          media_type: "audio/ogg",
          notes: nil,
          original_file_name: "test-audio-mono.ogg",
          recorded_date: "2014-02-07T17:50:03+10:00",
          sample_rate_hertz: 44100,
          site_id: 1001,
          status: "new",
          updated_at: "2014-02-07T18:49:54+10:00",
          updater_id: 1,
          uploader_id: 1,
          uuid: "d71c603f-2f65-4f3f-8a18-67d62f764001"
      }.to_json)
      # audio recording is created

      # validate that file can be moved?
      # 4. moving/copying file - 'transferring' - takes time
      # file being copied

      # if files are being checked by the website - website_check_file_hash
      # otherwise set to 'ready'

      # if website_check_file_hash

      # 5. record moving the original audio file - 'to_check'
      recording_moved_stub = stub_request(:put, 'localhost:3030/audio_recordings/240042/update_status')
      .with(body: '{"auth_token":"'+auth_token+'","audio_recording":{"file_hash":"SHA256::c110884206d25a83dd6d4c741861c429c10f99df9102863dde772f149387d891","uuid":"d71c603f-2f65-4f3f-8a18-67d62f764001"}}')
      .to_return(status: 204)

      # if there is an error on a file - set to status 'aborted'
      # if the hash of a new audio recording matches an existing one:
      #    if the status is new or aborted - use the existin record (set to new)
      #    if status is not new or aborted, this is a duplicate file, raise error

      harvester = Harvester::Manager.new(nil)
      harvester.start_harvesting


      login_stub.should have_been_made.once
      uploader_id_stub.should have_been_made.once
      create_stub.should have_been_made.once
      recording_moved_stub.should have_been_made.once

    end

  end
end