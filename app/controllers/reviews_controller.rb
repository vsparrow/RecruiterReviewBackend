class ReviewsController < ApplicationController
  def index
    reviews = Review.all
    # object = {review: {data: 1, moredata: 2}}
    # render json: object                       #also works
    # rjson = {}
    rjson = reviews.map do  |r|
      # puts r
      newjson = {
        user_id: r.user_id,
        recruiter_id: r.recruiter_id,
        review: r.review
      }
    end
    # puts rjson
    # render json: "HELLO REVIEW"  #works
    render json: rjson
  end
end #end class
