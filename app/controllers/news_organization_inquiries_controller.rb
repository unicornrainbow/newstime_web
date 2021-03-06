class NewsOrganizationInquiriesController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def new
  end

  def create
    name = params[:name]
    email = params[:email]
    organization = params[:organization]

    # Save these values as a record in the database, and allow to be retrieved
    # and read.
    NewsOrganizationInquiry.create(
      name: name,
      email: email,
      organization: organization
    )

    # Send email
    # TODO: Put in background, using sidekiq
    #NewsOrganizationInquiriesMailer.delay.new_inquiry(name, email, organization)

    redirect_to action: :success
  end

  def success
  end

end
