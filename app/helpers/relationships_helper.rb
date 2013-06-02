module RelationshipsHelper
  def submit_text
    @relationship.new_record? ? 'Create' : 'Save'
  end
end
