class ReviewsController < ApplicationController
  def index
    reviews = Review.all
    # object = {review: {data: 1, moredata: 2}}
    # render json: object                       #also works
    # rjson = {}
    rjson = reviews.map do  |r|
      # puts r
      newjson = {
        id: r.id,
        user_id: r.user_id,
        recruiter_id: r.recruiter_id,
        review: r.review
      }
    end
    # puts rjson
    # render json: "HELLO REVIEW"  #works
    render json: rjson
  end #end index

  # POST /reviews
  def create
    if params[:user_id] && params[:recruiter_id] && params[:review]
      user = User.find(params[:user_id])
      puts user
      recruiter = Recruiter.find(params[:recruiter_id])
      puts recruiter
      ################################
      params["got_interview"] ? got_interview = params["got_interview"] : got_interview = false
      params["got_job"] ? got_job = params["got_job"] : got_job = false
      got_job ? got_interview = true : "null" #if got job then must have had interview
      params["rating"] ? rating = params["rating"] : rating = 0 #0 means not rated
      params["recommended"] ? recommended = params["recommended"] : recommended = false
      params["ghoster"] ? ghoster = params["ghoster"] : ghoster = false

      review = Review.new(
        user_id: user.id,
        recruiter_id: recruiter.id,
        review: review,
        got_interview:  got_interview,
        got_job:  got_job,
        rating: rating,
        recommended: recommended,
        ghoster:  ghoster
      ) #Review.new

      if review.save
        render json: {"POSTED REVIEW": "ok"}  #works
      else
        render json: {"error": "ERROR SAVE POSTED REVIEW"}
      end
      ################################
      # render json: {"POSTED REVIEW": "ok"}  #works
    else
      render json: {"error": "no user_id or recruiter_id or review"}
    end #  if params[:user_id]
  end #class



  def show
    review = Review.find(params[:id])
    ################################
    # we may only need this if we want to go in deeper? depends on front end as well
    recruiter = Recruiter.find(review.recruiter_id)
    recruiterfullname = recruiter.firstname + " " + recruiter.lastname
    user = User.find(review.user_id)
    userfullname = user.firstname + " " + user.lastname
    # # puts params
    # # puts review
    # puts recruiter
    # puts user
    ##############################
    newjson = {
      id: review.id,
      user_id: review.user_id,
      userfullname: userfullname,
      recruiter_id: review.recruiter_id,
      recruiterfullname: recruiterfullname,
      review: review.review,
       got_interview:  review.got_interview,
       got_job:  review.got_job,
       rating: review.rating,
       is_generated: review.is_generated,
       recommended: review.recommended,
       ghoster:  review.ghoster
    } #newjson
    # render json: "HELLO REVIEW SHOW"  #works
    render json: newjson
  end
end #end class
