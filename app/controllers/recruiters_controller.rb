class RecruitersController < ApplicationController
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
end #class
