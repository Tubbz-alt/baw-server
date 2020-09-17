=begin
#SFTPGo

#SFTPGo REST API

The version of the OpenAPI document: 2.0.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0-SNAPSHOT

=end

require 'date'

module SftpgoGeneratedClient
  class Permission
    ALL = "*".freeze
    LIST = "list".freeze
    DOWNLOAD = "download".freeze
    UPLOAD = "upload".freeze
    OVERWRITE = "overwrite".freeze
    DELETE = "delete".freeze
    RENAME = "rename".freeze
    CREATE_DIRS = "create_dirs".freeze
    CREATE_SYMLINKS = "create_symlinks".freeze
    CHMOD = "chmod".freeze
    CHOWN = "chown".freeze
    CHTIMES = "chtimes".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = Permission.constants.select { |c| Permission::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #Permission" if constantValues.empty?
      value
    end
  end
end
