require 'spec_helper'

describe Relationship do
  describe '.valid?' do
    let(:parent) { Topic.create! }
    let(:child) { Topic.create! }

    subject { Relationship.new parent_id: parent.id, child_id: child.id }

    it { should be_valid }

    context "with a duplicate parent+child" do
      before do
        Relationship.create! parent_id: parent.id, child_id: child.id
      end

      it { should_not be_valid }
    end
  end
end
