require 'spec_helper'

describe "Alternate Titles" do
  describe 'POST /alternate_titles' do
    it "should create an AlternateTitle on the Topic" do
      topic = Topic.create! title: 'foo'
      post '/alternate_titles', alternate_title: { topic_id: topic.id, title: 'bar' }
      puts response.body
      response.status.should eq(302)
      topic.reload
      topic.alternate_titles.size.should eq(1)
      topic.alternate_titles.first.title.should eq('bar')
    end

    it "should fail without a title" do
      topic = Topic.create! title: 'foo'
      post '/alternate_titles', alternate_title: { topic_id: topic.id }
      # TODO appropriate response?
      # response.status.should eq(403)
      topic.alternate_titles.should be_empty
    end

    it "should fail without a topic_id" do
      topic = Topic.create! title: 'foo'
      post '/alternate_titles', alternate_title: { title: 'bar' }
      # TODO appropriate response?
      # response.status.should eq(403)
      topic.alternate_titles.should be_empty
    end
  end
end
