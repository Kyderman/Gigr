# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bands_musician, :class => 'BandsMusicians' do
    band_id 1
    musician_id 1
  end
end
