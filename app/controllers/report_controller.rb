# frozen_string_literal: true

require_relative '../services/file_service'
require_relative '../services/report_service'

# ReportController
class ReportController
  def initialize(logger)
    @logger = logger
    @file_service = FileService.new(logger)
    @report_service = ReportService.new(logger)
  end

  def run(input_path)
    @logger.debug('Run function starts')
    @logger.debug("Params is input_path: #{input_path}")

    report = @file_service.read input_path
    @logger.debug("Report inspect is: #{report.inspect}")

    value = @report_service.find(report)
    @logger.debug("Find value has like return value: #{value}")

    value_hard = @report_service.find_hard(report)
    @logger.debug("Find value has like return value: #{value}")

    @logger.debug('Run function ends')
    [value, value_hard]
  end
end
