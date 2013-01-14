class RegistrationsController < Devise::RegistrationsController
  def new
    # super
    redirect_to root_path, 
                flash: { notice: 
                        %Q[Sorry, not accepting new users right now.  
                        <a href="http://natewienert.com/codename-obtvse">obtvse</a>
                        is similar and much better anyway].html_safe }
  end

  def create
    # super
    redirect_to root_path, 
                flash: { notice: 
                        %Q[Sorry, not accepting new users right now.  
                        <a href="http://natewienert.com/codename-obtvse">obtvse</a>
                        is similar and much better anyway].html_safe }
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  def cancel
    super
  end
end