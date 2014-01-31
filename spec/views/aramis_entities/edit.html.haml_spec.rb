require 'spec_helper'

describe "aramis_entities/edit" do
  before(:each) do
    @aramis_entity = assign(:aramis_entity, stub_model(AramisEntity,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit aramis_entity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", aramis_entity_path(@aramis_entity), "post" do
      assert_select "input#aramis_entity_name[name=?]", "aramis_entity[name]"
      assert_select "textarea#aramis_entity_description[name=?]", "aramis_entity[description]"
    end
  end
end
