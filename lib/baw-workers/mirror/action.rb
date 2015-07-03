module BawWorkers
  module Mirror
    # Copies files from one location to another.
    class Action < BawWorkers::ActionBase

      class << self

        # Get the queue for this action. Used by Resque. Overrides resque-status class method.
        # @return [Symbol] The queue.
        def queue
          BawWorkers::Settings.actions.mirror.queue
        end

        # Perform work. Used by Resque.
        # @param [String] source
        # @param [String, Array<String>] destinations
        # @return [Boolean] true if successfully copied
        def action_perform(source, destinations)

          BawWorkers::Config.logger_worker.info(self.name) {
            "Started mirroring from #{source} to '#{destinations}'."
          }

          begin
            source_file, destination_files = action_validate(source, destinations)
            result = BawWorkers::Config.file_info.copy_to_many(source_file, destination_files)
          rescue => e
            BawWorkers::Config.logger_worker.error(self.name) { e }
            BawWorkers::Mail::Mailer.send_worker_error_email(
                BawWorkers::Mirror::Action,
                {source: source, destinations: destinations},
                queue,
                e
            )
            raise e
          end

          BawWorkers::Config.logger_worker.info(self.name) {
            "Completed mirror with result '#{result}'."
          }

          result
        end

        # Enqueue a file mirror request.
        # @param [String] source
        # @param [String, Array<String>] destinations
        # @return [void]
        def action_enqueue(source, destinations)
          source_file, destination_files = action_validate(source, destinations)
          result = BawWorkers::Mirror::Action.create(source: source_file, destinations: destination_files)
          BawWorkers::Config.logger_worker.info(self.name) {
            "Job enqueue returned '#{result}' using source #{source_file} and destinations #{destination_files.join(', ')}."
          }
          result
        end

        # Validate that source and destinations are paths, and are compatible with each other.
        def action_validate(source, destinations)
          source_file = BawWorkers::Validation.normalise_file(source)
          dest_files = BawWorkers::Validation.normalise_files(destinations, false).compact

          [source_file, dest_files]
        end

        # Get a Resque::Status hash for if a mirror job has a matching payload.
        # @param [String] source
        # @param [String, Array<String>] destinations
        # @return [Resque::Plugins::Status::Hash] status
        def get_job_status(source, destinations)
          source_file, destination_files = action_validate(source, destinations)
          payload = {source: source_file, destinations: destination_files}
          BawWorkers::ResqueApi.status(BawWorkers::Mirror::Action, payload)
        end

      end

      def perform_options_keys
        %w(source destinations)
      end

    end
  end
end