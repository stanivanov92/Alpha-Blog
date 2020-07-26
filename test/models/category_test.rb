# frozen_string_literal: true

require 'test_helper'
# Class Category Test
class CategoryTest < ActiveSupport::TestCase
  test 'category should be valid' do
    @category = Category.new(name: 'Sports')
    assert @category.valid?
    assert @category.name == 'Sports', ['The name is not equal to sport']
  end
end
