# frozen_string_literal: true

require 'logger'
require_relative 'controllers/report_controller'

logger = Logger.new($stdout)
logger.level = Logger::DEBUG
logger.formatter = proc do |severity, datetime, _progname, msg|
  class_name = caller_locations(1, 1)[0].label
  "#{datetime} #{severity} #{class_name} - #{msg}\n"
end

ENV['APP_ENV'] ||= 'development'
puts "Environment: #{ENV['APP_ENV']}"

report_controller = ReportController.new logger
value = report_controller.run 'app/inputs/input'
logger.info('=============== SOLUTIONs ===============')
logger.info("1 Part Solution: #{value}")
logger.info('2 Part Solution: <to be find>')
logger.info('=========================================')
