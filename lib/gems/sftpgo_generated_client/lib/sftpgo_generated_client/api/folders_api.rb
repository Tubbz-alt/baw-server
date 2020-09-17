=begin
#SFTPGo

#SFTPGo REST API

The version of the OpenAPI document: 2.0.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'cgi'

module SftpgoGeneratedClient
  class FoldersApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Adds a new folder
    # a new folder with the specified mapped_path will be added. To update the used quota parameters a quota scan is needed
    # @param base_virtual_folder [BaseVirtualFolder] 
    # @param [Hash] opts the optional parameters
    # @return [BaseVirtualFolder]
    def add_folder(base_virtual_folder, opts = {})
      data, _status_code, _headers = add_folder_with_http_info(base_virtual_folder, opts)
      data
    end

    # Adds a new folder
    # a new folder with the specified mapped_path will be added. To update the used quota parameters a quota scan is needed
    # @param base_virtual_folder [BaseVirtualFolder] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(BaseVirtualFolder, Integer, Hash)>] BaseVirtualFolder data, response status code and response headers
    def add_folder_with_http_info(base_virtual_folder, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FoldersApi.add_folder ...'
      end
      # verify the required parameter 'base_virtual_folder' is set
      if @api_client.config.client_side_validation && base_virtual_folder.nil?
        fail ArgumentError, "Missing the required parameter 'base_virtual_folder' when calling FoldersApi.add_folder"
      end
      # resource path
      local_var_path = '/folder'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(base_virtual_folder) 

      # return_type
      return_type = opts[:return_type] || 'BaseVirtualFolder' 

      # auth_names
      auth_names = opts[:auth_names] || ['BasicAuth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FoldersApi#add_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete an existing folder
    # @param folder_path [String] path to the folder to delete
    # @param [Hash] opts the optional parameters
    # @return [ApiResponse]
    def delete_folder(folder_path, opts = {})
      data, _status_code, _headers = delete_folder_with_http_info(folder_path, opts)
      data
    end

    # Delete an existing folder
    # @param folder_path [String] path to the folder to delete
    # @param [Hash] opts the optional parameters
    # @return [Array<(ApiResponse, Integer, Hash)>] ApiResponse data, response status code and response headers
    def delete_folder_with_http_info(folder_path, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FoldersApi.delete_folder ...'
      end
      # verify the required parameter 'folder_path' is set
      if @api_client.config.client_side_validation && folder_path.nil?
        fail ArgumentError, "Missing the required parameter 'folder_path' when calling FoldersApi.delete_folder"
      end
      # resource path
      local_var_path = '/folder'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'folder_path'] = folder_path

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] || 'ApiResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['BasicAuth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FoldersApi#delete_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Returns an array with one or more folders
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :offset  (default to 0)
    # @option opts [Integer] :limit The maximum number of items to return. Max value is 500, default is 100 (default to 100)
    # @option opts [String] :order Ordering folders by path. Default ASC
    # @option opts [String] :folder_path Filter by folder path, extact match case sensitive
    # @return [Array<BaseVirtualFolder>]
    def get_folders(opts = {})
      data, _status_code, _headers = get_folders_with_http_info(opts)
      data
    end

    # Returns an array with one or more folders
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :offset 
    # @option opts [Integer] :limit The maximum number of items to return. Max value is 500, default is 100
    # @option opts [String] :order Ordering folders by path. Default ASC
    # @option opts [String] :folder_path Filter by folder path, extact match case sensitive
    # @return [Array<(Array<BaseVirtualFolder>, Integer, Hash)>] Array<BaseVirtualFolder> data, response status code and response headers
    def get_folders_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: FoldersApi.get_folders ...'
      end
      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] < 0
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling FoldersApi.get_folders, must be greater than or equal to 0.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 500
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling FoldersApi.get_folders, must be smaller than or equal to 500.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling FoldersApi.get_folders, must be greater than or equal to 1.'
      end

      allowable_values = ["ASC", "DESC"]
      if @api_client.config.client_side_validation && opts[:'order'] && !allowable_values.include?(opts[:'order'])
        fail ArgumentError, "invalid value for \"order\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/folder'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'order'] = opts[:'order'] if !opts[:'order'].nil?
      query_params[:'folder_path'] = opts[:'folder_path'] if !opts[:'folder_path'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] || 'Array<BaseVirtualFolder>' 

      # auth_names
      auth_names = opts[:auth_names] || ['BasicAuth']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: FoldersApi#get_folders\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
