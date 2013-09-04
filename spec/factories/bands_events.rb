# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bands_event, :class => 'BandsEvents' do
    band_id 1
    event_id 1
  end
end
