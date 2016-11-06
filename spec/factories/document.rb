FactoryGirl.define do
  factory :document do
    name "document"
    user

    after(:create) do |document|
      create_list(:document_attachment, document: document)
    end
  end
end
