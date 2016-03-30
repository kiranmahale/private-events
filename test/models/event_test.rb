require 'test_helper'

class EventTest < ActiveSupport::TestCase
 	def setup
 		@user = users(:michael)
 		@event = @user.events.build(description: "Birthday event")
 	end

 	test "should be valid" do 
 		assert @event.valid?
 	end

 	test "user id should be present" do
 		@event.user_id = nil
 		assert_not @event.valid?
 	end

 	test "description should present" do
 		@event.description = " "
 		assert_not @event.valid?
 	end

 	test "description should be at most 140 character" do
 		@event.description = "a" * 141
 		assert_not @event.valid?
 	end

 	test "order should be most recent first" do
 		assert_equal events(:most_recent), Event.first
 	end
end
