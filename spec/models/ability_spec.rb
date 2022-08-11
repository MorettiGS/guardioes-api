require 'rails_helper'

RSpec.describe Ability, type: :model do
    before :all do
        @app = App.create!(app_name: "brasil", owner_country: "brasil")
        @app = @app.reload

        @ability = Ability.new(nil)
    end

    @array_valid = ["symptom", "syndrome", "content", "vaccine", "category", "message"]
    @array_valid_success = [:Symptom, :Syndrome, :Content, :Vaccine, :Category]
    @array_invalid = ["dose", "group", "message"]

    it "convert symbol to model" do 
        expect(@ability.convert_symbol(@array_valid)).to be @array_valid_success
    end

    it "does not convert symbol to model" do
        expect(@ability.convert_symbol(@array_invalid)).to be []
    end

end
