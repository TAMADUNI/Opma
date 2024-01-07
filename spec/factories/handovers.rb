FactoryBot.define do
  factory :handover do
    activities { "MyText" }
    blob_rates { 1.5 }
    ejection_rates { 1.5 }
    pending_issues { "MyText" }
    user { nil }
    acceptance_status { false }
    comments { "MyText" }
  end
end
