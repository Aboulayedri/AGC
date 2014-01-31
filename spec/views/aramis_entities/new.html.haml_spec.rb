require 'spec_helper'

describe "aramis_entities/new" do
  before(:each) do
    assign(:aramis_entity, stub_model(AramisEntity,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new aramis_entity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", aramis_entities_path, "post" do
      assert_select "input#aramis_entity_name[name=?]", "aramis_entity[name]"
      assert_select "textarea#aramis_entity_description[name=?]", "aramis_entity[description]"
    end
  end
end
