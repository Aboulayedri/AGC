require 'spec_helper'

describe "collaborators/new" do
  before(:each) do
    assign(:collaborator, stub_model(Collaborator,
      :prenom => "MyString",
      :nom => "MyString",
      :id_karma => "MyString",
      :role => "MyString",
      :email => "MyString",
      :etat => "MyString",
      :statut => "MyString",
      :niv_diplome => "MyString",
      :nat_diplome => "MyString",
      :entity_id => 1,
      :manager_id => 1,
      :commentaire => "MyText"
    ).as_new_record)
  end

  it "renders new collaborator form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", collaborators_path, "post" do
      assert_select "input#collaborator_prenom[name=?]", "collaborator[prenom]"
      assert_select "input#collaborator_nom[name=?]", "collaborator[nom]"
      assert_select "input#collaborator_id_karma[name=?]", "collaborator[id_karma]"
      assert_select "input#collaborator_role[name=?]", "collaborator[role]"
      assert_select "input#collaborator_email[name=?]", "collaborator[email]"
      assert_select "input#collaborator_etat[name=?]", "collaborator[etat]"
      assert_select "input#collaborator_statut[name=?]", "collaborator[statut]"
      assert_select "input#collaborator_niv_diplome[name=?]", "collaborator[niv_diplome]"
      assert_select "input#collaborator_nat_diplome[name=?]", "collaborator[nat_diplome]"
      assert_select "input#collaborator_entity_id[name=?]", "collaborator[entity_id]"
      assert_select "input#collaborator_manager_id[name=?]", "collaborator[manager_id]"
      assert_select "textarea#collaborator_commentaire[name=?]", "collaborator[commentaire]"
    end
  end
end
