class RecruitersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :dude_wheres_my_record

  def index
    recruiter = Recruiter.all
    # object = {review: {data: 1, moredata: 2}}
    # render json: object                       #also works
    # rjson = {}
    rjson = recruiter.map do  |r|
      # puts r

      newjson = {
        id: r.id,
        firstname: r.firstname,
        lastname: r.lastname,
        email: r.email,
        phonenumber: r.phonenumber,
        is_generated: r.is_generated,
        website: r.website,
        company: r.company,
        linkedin: r.linkedin,
        location: r.location
        # user_id: r.user_id,
        # recruiter_id: r.recruiter_id,
        # review: r.review
      }
    end
    # puts rjson
    # render json: "HELLO REVIEW"  #works
    render json: rjson
  end #end index


  def show
    recruiter=Recruiter.find(params[:id])
    if recruiter
      # render json: "HELLO REVIEW"  #works
      reviews = Review.all.select { |r| r.recruiter_id == recruiter.id}
      puts "*********************"
      puts reviews.as_json
      puts "*********************"

      newjson = {
        id: recruiter.id,
        firstname: recruiter.firstname,
        lastname: recruiter.lastname,
        email: recruiter.email,
        phonenumber: recruiter.phonenumber,
        is_generated: recruiter.is_generated,
        website: recruiter.website,
        company: recruiter.company,
        linkedin: recruiter.linkedin,
        location: recruiter.location,
        reviews: reviews.as_json
      }
      render json: newjson

    else
      render json: {"error": "recruiter not found"}
    end
  end #show

  def create
    if params[:firstname] && params[:lastname] && params[:email]#the right params
      #params to varaibles
      firstname = params[:firstname]
      lastname = params[:lastname]
      email = params[:email]
      params[:phonenumber] ? phonenumber = params[:phonenumber] : phonenumber = ""
      params[:website] ? website = params[:website] : website = ""
      params[:linkedin] ? linkedin = params[:linkedin] : linkedin = ""
      params[:location] ? location = params[:location] : location = ""
      params[:company] ? company = params[:company] : company = ""
      # params[:user_id] ? user_id = params[:user_id] : user_id = ""  #future setup, not process if not there.
      #new recruiter
      recruiter = Recruiter.new(
        firstname: firstname,
        lastname: lastname,
        email: email,
        phonenumber: phonenumber,
        website: website,
        company: company,
        linkedin: linkedin,
        location: location
        # user_id: user_id
      )
      if recruiter.save
        render json: {"POSTED RECRUITER": "ok"}  #works#send success
      else
        render json: {"error": "ERROR SAVE POSTED RECRUITER"} #else send error on save
      end
    else
      render json: {"error": "missing data"}
    end
  end #create

  def dude_wheres_my_record
    render json: {"error": "not found"}
  end
end #class
