# frozen_string_literal: true

# ReportService
class ReportService
  def initialize(logger)
    @logger = logger
  end

  def find_value(report)
    @logger.debug('Find Entries function starts')
    @logger.debug("Params is report: #{report.inspect}")

    report.each_with_index do |value, index|
      @logger.debug("In loop, value #{value}")
      candidate = 2020 - value
      @logger.debug("In loop, candidate #{candidate}")
      return value * candidate if report[(index + 1)..].include? candidate

      @logger.debug("There isn't candidate :-(")
    end
  end
end
