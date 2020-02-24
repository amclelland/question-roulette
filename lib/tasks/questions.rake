namespace :questions do
  task :post => :environment do
    QuestionPoster.post_question_of_the_day
  end
end
