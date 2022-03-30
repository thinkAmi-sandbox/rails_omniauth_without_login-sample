class Api::MemosController < ApplicationController
  before_action :doorkeeper_authorize!

  def index
    unless current_resource_owner
      return render json: {message: 'deny'}
    end

    memo = Memo.find_by(id: current_resource_owner.id)

    render json: {message: memo ? memo.favorite : 'not found'}
  end

  private def current_resource_owner
    @member ||= Member.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end