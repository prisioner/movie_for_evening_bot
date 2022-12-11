class CallbacksController < ApplicationController
  def telegram
    unless params.dig(:callback, :message).present?
      head :ok
      return
    end

    TgBot::Operations::ReactToMessage.call(params[:callback])

    head :ok
  end
end
