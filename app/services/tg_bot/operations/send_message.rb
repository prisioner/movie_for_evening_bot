module TgBot
  module Operations
    class SendMessage < BaseOperation
      def initialize(chat_id, text)
        @chat_id = chat_id
        @text = text
      end

      def call
        result = HTTParty.post(send_message_url, headers: headers, body: message_params.to_json)

        # Rails.logger.debug(result.body) unless result.success?

        result.success?
      end

      private

      attr_reader :chat_id, :text

      def send_message_url
        "#{API_URL}/sendMessage"
      end

      def headers
        {
          'Content-Type' => 'application/json'
        }
      end

      def message_params
        {
          chat_id: chat_id,
          text: text,
        }
      end
    end
  end
end
