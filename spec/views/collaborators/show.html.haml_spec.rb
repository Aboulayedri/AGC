require 'spec_helper'

describe "collaborators/show" do
  before(:each) do
    @collaborator = assign(:collaborator, stub_model(Collaborator,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Prenom/)
    rendered.should match(/Nom/)
    rendered.should match(/Id Karma/)
    rendered.should match(/Role/)
    rendered.should match(/Email/)
    rendered.should match(/Etat/)
    rendered.should match(/Statut/)
    rendered.should match(/Niv Diplome/)
    rendered.should match(/Nat Diplome/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
  end
end
