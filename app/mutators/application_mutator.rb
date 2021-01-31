class ApplicationMutator
  attr_reader :record

  def initialize(record)
    @record = record
    @errors = {}
  end

  def merge_errors(new_errors)
    @errors.merge!(new_errors.as_json)
  end

  def errors
    @errors.merge(@record.errors.as_json)
  end
end
