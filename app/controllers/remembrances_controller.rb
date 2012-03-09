class RemembrancesController < ApplicationController
  respond_to :json
  
  def show
    options = {
      :partial => 'sidebar.html.haml',
      :layout => false
    }
    respond_with div: render_to_string(options)
  end
end
