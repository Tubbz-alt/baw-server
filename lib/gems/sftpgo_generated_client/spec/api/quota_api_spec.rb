=begin
#SFTPGo

#SFTPGo REST API

The version of the OpenAPI document: 2.0.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for SftpgoGeneratedClient::QuotaApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'QuotaApi' do
  before do
    # run before each test
    @api_instance = SftpgoGeneratedClient::QuotaApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of QuotaApi' do
    it 'should create an instance of QuotaApi' do
      expect(@api_instance).to be_instance_of(SftpgoGeneratedClient::QuotaApi)
    end
  end

  # unit tests for folder_quota_update
  # update the folder used quota limits
  # Set the current used quota limits for the given folder
  # @param base_virtual_folder The only folder mandatory fields are mapped_path,used_quota_size and used_quota_files. Please note that if the used quota fields are missing they will default to 0
  # @param [Hash] opts the optional parameters
  # @option opts [String] :mode the update mode specifies if the given quota usage values should be added or replace the current ones
  # @return [ApiResponse]
  describe 'folder_quota_update test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_folders_quota_scans
  # Get the active quota scans for folders
  # @param [Hash] opts the optional parameters
  # @return [Array<FolderQuotaScan>]
  describe 'get_folders_quota_scans test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_quota_scans
  # Get the active quota scans for users home directories
  # @param [Hash] opts the optional parameters
  # @return [Array<QuotaScan>]
  describe 'get_quota_scans test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for quota_update
  # update the user used quota limits
  # Set the current used quota limits for the given user
  # @param user The only user mandatory fields are username,used_quota_size and used_quota_files. Please note that if the quota fields are missing they will default to 0
  # @param [Hash] opts the optional parameters
  # @option opts [String] :mode the update mode specifies if the given quota usage values should be added or replace the current ones
  # @return [ApiResponse]
  describe 'quota_update test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for start_folder_quota_scan
  # start a new folder quota scan
  # A quota scan update the number of files and their total size for the specified folder
  # @param base_virtual_folder 
  # @param [Hash] opts the optional parameters
  # @return [ApiResponse]
  describe 'start_folder_quota_scan test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for start_quota_scan
  # start a new user quota scan
  # A quota scan update the number of files and their total size for the specified user
  # @param user 
  # @param [Hash] opts the optional parameters
  # @return [ApiResponse]
  describe 'start_quota_scan test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
