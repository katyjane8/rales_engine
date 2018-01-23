RSpec.configure do |config|
  module FactoryBot::Syntax::Methods
    def config.params_for(model)
      
    end
  end

  config.include FactoryBot::Syntax::Methods
end
