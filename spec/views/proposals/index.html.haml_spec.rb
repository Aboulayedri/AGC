require 'spec_helper'

describe "proposals/index" do
  before(:each) do
    assign(:proposals, [
      stub_model(Proposal,
        :consultant_id => 1,
        :nbre_jour => 2,
        :etat => "Etat"
      ),
      stub_model(Proposal,
        :consultant_id => 1,
        :nbre_jour => 2,
        :etat => "Etat"
      )
    ])
  end

  it "renders a list of proposals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Etat".to_s, :count => 2
  end
end
