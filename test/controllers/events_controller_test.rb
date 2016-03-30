require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
  	@event = events(:one)
  end

  test "should redirect create when not logged in" do
  	assert_no_difference 'Event.count' do
  		post :create, event: { description: "Lorem ipsum" }
  end
  assert_redirected_to login_url
end

 test "should redirect destroy when not logged in" do
 	assert_no_difference 'Event.count' do
 		delete :destroy, id: @event
 	end
 	assert_redirected_to login_url
 end
 end
end
