require 'test_helper'
class LogoutTest < ActionDispatch::IntegrationTest
	test "logout" do
	get root_path
	post login_path,session:{ user_id: 7296 }
	assert is_logged_in?
	follow_redirect!
	get root_path
	delete logout_path
	end
end
