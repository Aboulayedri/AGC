require 'spec_helper'

describe "collaborators/index" do
  before(:each) do
    assign(:collaborators, [
      stub_model(Collaborator,
        :prenom => "Prenom",
        :nom => "Nom",
        :id_karma => "Id Karma",
        :role => "Role",
        :email => "Email",
        :etat => "Etat",
        :statut => "Statut",
        :niv_diplome => "Niv Diplome",
        :nat_diplome => "Nat Diplome",
        :entity_id => 1,
        :manager_id => 2,
        :commentaire => "MyText"
      ),
      stub_model(Collaborator,
        :prenom => "Prenom",
        :nom => "Nom",
        :id_karma => "Id Karma",
        :role => "Role",
        :email => "Email",
        :etat => "Etat",
        :statut => "Statut",
        :niv_diplome => "Niv Diplome",
        :nat_diplome => "Nat Diplome",
        :entity_id => 1,
        :manager_id => 2,
        :commentaire => "MyText"
      )
    ])
  end

  it "renders a list of collaborators" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Prenom".to_s, :count => 2
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Id Karma".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Etat".to_s, :count => 2
    assert_select "tr>td", :text => "Statut".to_s, :count => 2
    assert_select "tr>td", :text => "Niv Diplome".to_s, :count => 2
    assert_select "tr>td", :text => "Nat Diplome".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
