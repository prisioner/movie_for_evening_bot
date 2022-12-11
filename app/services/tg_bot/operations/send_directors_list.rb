module TgBot
  module Operations
    class SendDirectorsList < BaseOperation
      def initialize(chat_id)
        @chat_id = chat_id
      end

      def call
        @directors = Director.order("RANDOM()").first(15).map(&:name)
        @directors_count = Director.count

        SendMessage.call(chat_id, message_text)
      end

      private

      attr_reader :chat_id

      def message_text
        <<~MESSAGE_TEXT
          Пришли имя режиссёра и получи рекомендацию фильма в ответ!

          Режиссёров в базе: #{@directors_count}

          Вот некоторые из них:
          #{@directors.join("\n")}
        MESSAGE_TEXT
      end
    end
  end
end
