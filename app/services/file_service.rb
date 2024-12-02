# frozen_string_literal: true

# FileService
class FileService
  def initialize(logger)
    @logger = logger
  end

  def read(_path)
    @logger.debug("Params is input_path: #{input_path}")

    if File.exist?(input_path)
      File.readlines(input_path).map do |line|
        Integer(line.strip)
      rescue ArgumentError => e
        @logger.error("Conversion error '#{line.strip}': #{e.message}")
      end.compact
    else
      @logger.error("File '#{input_path}' doesn't exist.")
    end
  end
end
