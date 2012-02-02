# encoding: utf-8

require "test_helper"

class AspectaTest < Test::Unit::TestCase

  # ===========
  # = helpers =
  # ===========

  def fixture(file)
    File.open(File.dirname(__FILE__) + "/fixtures/#{file}")
  end

  # ===========
  # = general =
  # ===========

  def test_skips_empty_uploader
    user = UserWithInvalidValidation.new

    assert user.valid?
  end

  def test_requires_width_or_height_option
    user = UserWithInvalidValidation.new
    user.avatar = fixture "200x200.png"

    exception = assert_raise ArgumentError do
      user.valid?
    end

    assert_equal "Specify the :width and / or :height option",
      exception.message
  end

  def test_requires_minimum_or_maximum_for_height_option
    user = UserWithInvalidValitionHeightOptions.new
    user.avatar = fixture "200x200.png"

    exception = assert_raise ArgumentError do
      user.valid?
    end

    assert_equal "Specify the :minimum and / or :maximum option for :height",
      exception.message
  end

  def test_requires_minimum_or_maximum_for_width_option
    user = UserWithInvalidValitionWidthOptions.new
    user.avatar = fixture "200x200.png"

    exception = assert_raise ArgumentError do
      user.valid?
    end

    assert_equal "Specify the :minimum and / or :maximum option for :width",
      exception.message
  end

  # =================
  # = minimum width =
  # =================

  def test_valid_minimum_width
    user = UserMinimumWidth200.new

    user.avatar = fixture "200x200.png"
    assert user.valid?
  end

  def test_invalid_minimum_width
    user = UserMinimumWidth200.new

    user.avatar = fixture "199x199.png"
    assert ! user.valid?
    assert user.errors[:avatar].
      include?("image is too narrow, minimum is 200 pixels")
  end

  # ==================
  # = minimum height =
  # ==================

  def test_valid_minimum_height
    user = UserMinimumHeight200.new

    user.avatar = fixture "200x200.png"
    assert user.valid?
  end

  def test_invalid_minimum_height
    user = UserMinimumHeight200.new

    user.avatar = fixture "199x199.png"
    assert ! user.valid?
    assert user.errors[:avatar].
      include?("image is too short, minimum is 200 pixels")
  end

  # =================
  # = maximum width =
  # =================

  def test_valid_maximum_width
    user = UserMaximumWidth200.new

    user.avatar = fixture "200x200.png"
    assert user.valid?
  end

  def test_invalid_maximum_width
    user = UserMaximumWidth200.new

    user.avatar = fixture "201x201.png"
    assert ! user.valid?
    assert user.errors[:avatar].
      include?("image is too wide, maximum is 200 pixels")
  end

  # ==================
  # = maximum height =
  # ==================

  def test_valid_maximum_height
    user = UserMaximumHeight200.new

    user.avatar = fixture "200x200.png"
    assert user.valid?
  end

  def test_invalid_maximum_height
    user = UserMaximumHeight200.new

    user.avatar = fixture "201x201.png"
    assert ! user.valid?
    assert user.errors[:avatar].
      include?("image is too tall, maximum is 200 pixels")
  end
end