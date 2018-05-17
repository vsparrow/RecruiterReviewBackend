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
    puts "*****************"
    puts params #  Parameters: {"testbodykey"=>"testbosyvalue"}
    puts "*****************"
    # @todo = Todo.create(todo_params)
    # json_response(@todo, :created)
    render json: {"POSTED REVIEW": "ok"}  #works
    # https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
  end



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
