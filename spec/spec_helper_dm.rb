require_relative 'spec_helper_core_ext'
require 'dm-core'
require 'dm-validations'
require 'dm-types'
require 'dm-observer'

module DataMapperSpecHelpers
  STUB_RESOURCE_DEFAULTS = {
    dirty_self?:    false,
    dirty_parents?: false,
    valid?:         true,
    save_self:      true,
    save_parents:   true
  }

  def stub_resource(name="resource", attributes={})
    stub(name, STUB_RESOURCE_DEFAULTS.merge(attributes)).tap do |r|
      r.stub!(:instance_variable_get) do |ivar_name|
        attr_name = ivar_name.to_s.tr('@', '').to_sym
        attributes[attr_name]
      end
    end
  end
end

RSpec.configure do |config|
  config.before(:suite) do
    DataMapper.finalize
  end

  config.include(DataMapperSpecHelpers, dm: true)
end
