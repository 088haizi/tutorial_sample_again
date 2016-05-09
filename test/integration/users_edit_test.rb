require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unseccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    patch user_path(@user), user: { name: '',
                                    email: 'foo@invalid',
                                    password:               'foo',
                                    password_confirmation:  'bar' }
    assert_template 'users/edit'
  end

  # 确认更新用户的操作表现正常，我们提交有效的信息。然后检查显示了闪现消
  # 息，而且成功重定向到了用户的资料页面，同时还要确认数据库中保存的用户
  # 信息也正确更新了。

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name = "Foo bar"
    email = "foo@bar.com"
    patch user_path(@user), user: { name: name,
                                    email: email,
                                    password:               '',
                                    password_confirmation:  '' }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end
end
