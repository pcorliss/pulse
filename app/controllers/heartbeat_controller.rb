class HeartbeatController < ApplicationController
  def show
    render plain: 'OK'
  end
end

