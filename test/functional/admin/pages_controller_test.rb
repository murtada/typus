require "test_helper"

=begin

  What's being tested here?

    - Scopes

=end

class Admin::PagesControllerTest < ActionController::TestCase

  setup do
    @typus_user = Factory(:typus_user)
    @request.session[:typus_user_id] = @typus_user.id
  end

  teardown do
    Page.delete_all
    TypusUser.delete_all
  end

  context "index" do

    setup do
      5.times do
        Factory(:page)
        Factory(:page, :status => false)
      end
    end

    should "return unscoped results" do
      assert Page.count.eql?(5)
      get :index
      assert assigns(:items).size.eql?(10)
    end
  end

end
