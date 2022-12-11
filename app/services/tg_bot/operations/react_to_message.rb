module TgBot
  module Operations
    class ReactToMessage < BaseOperation
      def initialize(webhook)
        @message = Values::Message.new(webhook[:message])
      end

      def call
        return unless message.private?

        case message.text
        when "/start"
          SendDirectorsList.call(chat_id)
        else
          SendMovieRecommendation.call(chat_id, message.text)
        end
      end

      private

      attr_reader :message

      def chat_id
        message.chat.id
      end
    end
  end
end
