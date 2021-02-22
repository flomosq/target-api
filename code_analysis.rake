task code_analysis: :environment do
  sh 'bundle exec rubocop .'
  sh 'bundle exec reek app lib public spec tmp'
  sh 'bundle exec rails_best_practices .'
  sh 'bundle exec brakeman . -z -q'
end
