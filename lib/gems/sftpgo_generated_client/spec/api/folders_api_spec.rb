=begin
#SFTPGo

#SFTPGo REST API

The version of the OpenAPI document: 2.0.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for SftpgoGeneratedClient::FoldersApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'FoldersApi' do
  before do
    # run before each test
    @api_instance = SftpgoGeneratedClient::FoldersApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of FoldersApi' do
    it 'should create an instance of FoldersApi' do
      expect(@api_instance).to be_instance_of(SftpgoGeneratedClient::FoldersApi)
    end
  end

  # unit tests for add_folder
  # Adds a new folder
  # a new folder with the specified mapped_path will be added. To update the used quota parameters a quota scan is needed
  # @param base_virtual_folder 
  # @param [Hash] opts the optional parameters
  # @return [BaseVirtualFolder]
  describe 'add_folder test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_folder
  # Delete an existing folder
  # @param folder_path path to the folder to delete
  # @param [Hash] opts the optional parameters
  # @return [ApiResponse]
  describe 'delete_folder test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_folders
  # Returns an array with one or more folders
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :offset 
  # @option opts [Integer] :limit The maximum number of items to return. Max value is 500, default is 100
  # @option opts [String] :order Ordering folders by path. Default ASC
  # @option opts [String] :folder_path Filter by folder path, extact match case sensitive
  # @return [Array<BaseVirtualFolder>]
  describe 'get_folders test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
