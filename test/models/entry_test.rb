require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  # test 'the truth' do
  #   assert true
  # end
  def setup
    @user = AdminUser.new(name: 'test', email: 'poeoe@gmail.com')
    @entries = @user.entries.build(title: 'soneyu',
                                   body_html: '人生はとてもつらい', body_md: '人生初')
  end
  test 'should be valid' do
    assert @entries.valid?
  end

  test 'title be should be present' do
    @entries.title = '  '
    assert_not @entries.valid?
  end

  test 'body_html be should be present' do
    @entries.body_html = '  '
    assert_not @entries.valid?
  end

  test 'body_md be should be present' do
    @entries.body_md = '  '
    assert_not @entries.valid?
  end

  test 'parent AdminUser deleted' do
    user = AdminUser.new(name: 'deletend', email: 'deletend@example.com')
    user.save
    assert_difference 'Entry.count', 1 do
      entries = user.entries.build(title: 'ごっどプログラマーです',
                                   body_html: '神です', body_md: '神です')
      entries.save
    end
    assert_difference 'Entry.count', -1 do
      user.destroy
    end
  end
end
