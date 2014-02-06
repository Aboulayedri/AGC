class CollaboratorMailer < ActionMailer::Base
  default from: "Olivier Rabilloud <olivier.rabilloud@devoteam.com>"

  def envoyer_codes_imputation(proposition)
    @consultant = proposition.consultant
    @projet     = proposition.project
    mail(to: "#{@consultant.name} <#{@consultant.email}>", subject: "DRI : Codes ARAMIS")
  end
end
