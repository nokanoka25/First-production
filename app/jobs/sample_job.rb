class SampleJob < ApplicationJob
    queue_as :default

    def perform(message)
      Rails.logger.info "SampleJob is running: #{message}"
    end
end
