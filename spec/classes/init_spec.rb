require 'spec_helper'
describe 'riofs' do

  context 'with defaults for all parameters' do
    it { should contain_class('riofs') }
  end
end
