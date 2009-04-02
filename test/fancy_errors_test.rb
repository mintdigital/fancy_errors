require 'helper'

class FancyErrorsTest < Test::Unit::TestCase
  def setup
    @errors = FancyErrors.new(Base.new)
  end

  context "#full_messages" do
    it "returns just the message when it starts with ^ " do
      @errors.add(:title, '^That title sucks')
      @errors.full_messages.should == ['That title sucks']
    end

    it "does not change messages that don't start with ^" do
      @errors.add(:title, "can't be blank")
      @errors.full_messages.should == ["Title can't be blank"]
    end

    it "can mix and match" do
      @errors.add_to_base('You fail')
      @errors.add(:title, '^That title sucks')
      @errors.add(:title, "can't be blank")
      ['You fail', "That title sucks", "Title can't be blank"].each do |err|
        @errors.full_messages.should include(err)
      end
    end

    it "returns ordered errors for object when given an order key" do
      [:title, :snippet, :content].each do |attribute|
        @errors.add(attribute, "can't be blank")
      end
      @errors.full_messages(:order => [:snippet, :title, :content]).should == [
        "Snippet can't be blank",
        "Title can't be blank",
        "Content can't be blank"
      ]
    end

    it "excludes ordering attributes that don't have errors" do
      @errors.add(:title, "can't be blank")
      @errors.full_messages(:order => [:snippet, :title, :content]).
        should == ["Title can't be blank"]
    end
  end

  context "#full_messages_on" do
    it "returns empty if no error on that attribute" do
      @errors.full_messages_on(:title).should == []
    end

    it "returns just the message when it starts with ^ " do
      @errors.add(:title, '^That title sucks')
      @errors.full_messages_on(:title).should == ['That title sucks']
    end

    it "does not change messages that don't start with ^" do
      @errors.add(:title, "can't be blank")
      @errors.full_messages_on(:title).should == ["Title can't be blank"]
    end

    it "works with errors on base" do
      @errors.add_to_base('You fail')
      @errors.full_messages_on(:base).should == ['You fail']
    end
  end

  it "allows full, ordered messages" do
    @errors.add(:snippet, "must be less than 160 characters")
    @errors.add(:content, "^You must have content")
    @errors.add(:title, "can't be blank")
    @errors.full_messages(:order => [:title, :snippet, :content]).should == [
      "Title can't be blank",
      "Snippet must be less than 160 characters",
      "You must have content"
    ]
  end
end
