require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :name => "MyString",
      :domain_id => 1,
      :chef_id => 1,
      :maitrise_ouvrage_id => 1,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", projects_path, "post" do
      assert_select "input#project_name[name=?]", "project[name]"
      assert_select "input#project_domain_id[name=?]", "project[domain_id]"
      assert_select "input#project_chef_id[name=?]", "project[chef_id]"
      assert_select "input#project_maitrise_ouvrage_id[name=?]", "project[maitrise_ouvrage_id]"
      assert_select "textarea#project_description[name=?]", "project[description]"
    end
  end
end
