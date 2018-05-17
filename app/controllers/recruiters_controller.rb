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
        location: recruiter.location
      }
      render json: newjson

    else
      render json: {"error": "recruiter not found"}
    end
  end #show

  def dude_wheres_my_record
    render json: {"error": "not found"}
  end
end #class
