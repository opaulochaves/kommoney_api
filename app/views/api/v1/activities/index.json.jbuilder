json.activities do |json|
  json.array! @activities, partial: 'activity', as: :activity
end
