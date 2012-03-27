require_relative 'spec_helper_dm'

RSpec.configure do |config|
  config.before(:suite) do
    # DM must have a default repo, even if it's not used
    unless DataMapper::Repository.adapters.key?(:default)
      DataMapper.setup(:default, "abstract::")
    end
    DataMapper.setup(:nulldb, "in_memory::")
  end

  config.around(:each, :nulldb => true) do |example|
    DataMapper.repository(:nulldb) do |repository|
      repository.adapter.reset
      example.run
    end
  end
end
