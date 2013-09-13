# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :musicians_instrument, :class => 'MusiciansInstruments' do
    musician_id 1
    instrument_id 1
  end
end
