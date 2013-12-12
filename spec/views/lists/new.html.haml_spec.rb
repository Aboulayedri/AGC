require 'spec_helper'

describe "lists/new" do
  before(:each) do
    assign(:list, stub_model(List,
      :entity_id => 1
    ).as_new_record)
  end

  it "renders new list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lists_path, "post" do
      assert_select "input#list_entity_id[name=?]", "list[entity_id]"
    end
  end
end
