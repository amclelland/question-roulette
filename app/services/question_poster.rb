class QuestionPoster
  def self.post_question_of_the_day
    new.post_question_of_the_day
  end

  def post_question_of_the_day
    return if Date.today.is_weekend?
    return if random_unasked_question.blank?

    post_to_slack(random_unasked_question.text)
    random_unasked_question.mark_asked!
  end

  private

  def post_to_slack(text)
    Slack.configure do |config|
      config.token = Rails.application.credentials.slack_token
    end

    client = Slack::Web::Client.new

    client.chat_postMessage(
      channel: '#private-shronkey-chat',
      text: "Today's Question: #{text}",
      username: 'Question Roulette',
      icon_url: 'https://emoji.slack-edge.com/T029BMC1C/shronkey/2831c2e44f246bc2.png'
    )
  end

  def random_unasked_question
    @random_unasked_question ||= Question.unasked.sample
  end
end
