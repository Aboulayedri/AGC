require 'spec_helper'

describe "proposals/edit" do
  before(:each) do
    @proposal = assign(:proposal, stub_model(Proposal,
      :consultant_id => 1,
      :nbre_jour => 1,
      :etat => "MyString"
    ))
  end

  it "renders the edit proposal form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", proposal_path(@proposal), "post" do
      assert_select "input#proposal_consultant_id[name=?]", "proposal[consultant_id]"
      assert_select "input#proposal_nbre_jour[name=?]", "proposal[nbre_jour]"
      assert_select "input#proposal_etat[name=?]", "proposal[etat]"
    end
  end
end
