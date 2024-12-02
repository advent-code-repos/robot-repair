# frozen_string_literal: true

# ReportService
class ReportService
  def initialize(logger)
    @logger = logger
  end

  def find(report)
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

  def find_hard(report)
    @logger.debug("Params is report: #{report.inspect}")
    report.each_with_index do |value, index|
      result = find_triplet(report, value, index)
      return result if result
    end
    @logger.debug('No triplet found :-(')
  end

  private

  def find_triplet(report, value, index)
    pivot = 2020 - value
    @logger.debug("Processing value #{value} with pivot #{pivot}")
    find_candidates(report[(index + 1)..], pivot, value)
  end

  def find_candidates(sub_report, pivot, value)
    sub_report.each_with_index do |candidate, j_index|
      another_candidate = pivot - candidate
      if sub_report[(j_index + 1)..].include?(another_candidate)
        @logger.debug("Found triplet: #{value}, #{candidate}, #{another_candidate}")
        return value * candidate * another_candidate
      end
    end
    nil
  end
end
