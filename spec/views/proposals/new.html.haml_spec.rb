require 'spec_helper'

describe "proposals/new" do
  before(:each) do
    assign(:proposal, stub_model(Proposal,
      :consultant_id => 1,
      :nbre_jour => 1,
      :etat => "MyString"
    ).as_new_record)
  end

  it "renders new proposal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", proposals_path, "post" do
      assert_select "input#proposal_consultant_id[name=?]", "proposal[consultant_id]"
      assert_select "input#proposal_nbre_jour[name=?]", "proposal[nbre_jour]"
      assert_select "input#proposal_etat[name=?]", "proposal[etat]"
    end
  end
end
