class CollaboratorMailer < ActionMailer::Base
  default from: "abdoulaye.soumare@devoteam.com"

  def envoyer_codes_imputation(proposition)
    @consultant = proposition.consultant
    @projet     = proposition.project
    mail(to: @consultant.email, subject: "Vos codes d'imputation Aramis")
  end
end
