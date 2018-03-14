class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail to: user.email, subject:"Welcome to Unitix"
  end

  def purchase(user, ticket)
    @user = user
    @ticket2 = ticket
    mail to: user.email, subject: "Unitix: Thank you for your purchase!"
  end

  def ticket_purchased(ticket)
    @user = ticket.user
    @ticket = ticket
    mail to: @user.email, subject: "Unitix: your ticket has been sold!"
  end
end
