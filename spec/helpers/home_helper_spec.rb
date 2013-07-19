require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe HomeHelper do
  describe "pretty_alternate_titles()" do
    it "should output an empty string for no alternates" do
      topic = Topic.new
      helper.pretty_alternate_titles(topic).should eq('')
    end

    it "should output a single alternate as-is" do
      topic = Topic.create!(title: 'foo')
      topic.alternate_titles.create!(title: 'bar')
      helper.pretty_alternate_titles(topic).should eq('"bar"')
    end

    it "should output a single alternate as-is" do
      topic = Topic.create!(title: 'foo')
      topic.alternate_titles.create!(title: 'bar')
      helper.pretty_alternate_titles(topic).should eq('"bar"')
    end

    it "should output two alternates with an 'or'" do
      topic = Topic.create!(title: 'foo')
      topic.alternate_titles.create!(title: 'bar')
      topic.alternate_titles.create!(title: 'baz')

      helper.pretty_alternate_titles(topic).should eq('"bar" or "baz"')
    end

    it "should multiple alternates with commas, then an 'or'" do
      topic = Topic.create!(title: 'foo')
      topic.alternate_titles.create!(title: 'bar')
      topic.alternate_titles.create!(title: 'baz')
      topic.alternate_titles.create!(title: 'blip')

      helper.pretty_alternate_titles(topic).should eq('"bar", "baz" or "blip"')
    end
  end
end
