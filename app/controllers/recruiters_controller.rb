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
      reviews = reviews.sort_by { |r| r.id}.reverse #timing benchmark is best according to https://stackoverflow.com/questions/4264133/descending-sort-by-value-of-a-hash-in-ruby
      # puts "*********************"
      average_rating = get_average_rating(reviews)
      # puts reviews.as_json
      # puts "*********************"

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
        average_rating: average_rating,
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
        render json: {"POSTED RECRUITER": "ok", recruiter_id: recruiter.id}  #works#send success
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

  def search
    puts "*******************"
    # puts params
    # puts params[:search]
    puts "*******************"
    searchterm = params[:search]
    response = search_recruiters(searchterm)                                    #search recruiters for term
    puts response
    # render json: {"received": "request"}
    render json: {response_recruiters: response}
  end #search

  private
  def search_recruiters(searchterm)
    # puts searchterm
    recruiters = Recruiter.all
    contain_searchterm=[]
    recruiters.each do |recruiter|
      # recruiter.select { |key,value| value.include?(searchterm)} #not work
      # puts recruiter #works
      # puts recruiter.attributes #works
       # recruiter.attributes.select { |key,value| puts key} #works
       # recruiter.attributes.select { |key,value| puts value} #works
        # recruiter.attributes.each { |key,value|  puts value; value.include?(searchterm)} #not work
       contain_searchterm.push([recruiter,"firstname"]) if recruiter.firstname.downcase.include?(searchterm.downcase)
       contain_searchterm.push([recruiter,"lastname"]) if recruiter.lastname.downcase.include?(searchterm.downcase)
       contain_searchterm.push([recruiter,"email"]) if recruiter.email.downcase.include?(searchterm.downcase)
       contain_searchterm.push([recruiter,"website"]) if recruiter.website.downcase.include?(searchterm.downcase)
       contain_searchterm.push([recruiter,"company"]) if recruiter.company.downcase.include?(searchterm.downcase)
       contain_searchterm.push([recruiter,"linkedin"]) if recruiter.linkedin.downcase.include?(searchterm.downcase)
       contain_searchterm.push([recruiter,"location"]) if recruiter.location.downcase.include?(searchterm.downcase)
       contain_searchterm.push([recruiter,"phonenumber"]) if recruiter.phonenumber.include?(searchterm.downcase)
    end # each
    # puts contain_searchterm
    #now return AR objects or a JSON?

    # "donaldduck"
    make_jsonable_object(contain_searchterm)
  end

  def make_jsonable_object(activerecord_objects_array) #possibly highlight what the search term was
    jsonable_object= []
    activerecord_objects_array.each do | recruiter|
      json = {
        id: recruiter[0].id,
        firstname: recruiter[0].firstname,
        lastname: recruiter[0].lastname,
        email: recruiter[0].email,
        phonenumber: recruiter[0].phonenumber,
        is_generated: recruiter[0].is_generated,
        website: recruiter[0].website,
        company: recruiter[0].company,
        linkedin: recruiter[0].linkedin,
        location: recruiter[0].location,
        foundterm: recruiter[1]
        # reviews: reviews.as_json
      }
    jsonable_object.push(json)
    end #each
    jsonable_object
  end

  def get_average_rating(reviews)
    average_rating = 0
    rating_exists = 0
    old_average_rating = 0
    if reviews.length === 0
      average_rating = 0
    else
      reviews.each do  |r|
        if r.rating
          average_rating += r.rating
          rating_exists += 1
        end #if r.review
      end  #each
      if rating_exists > 0
        old_average_rating = average_rating
        average_rating = average_rating.to_f / rating_exists  #could use float to get 1/2 score but just MVP now
      end
    end
    puts "*********************"
    # # puts review.first.rating
    # # puts reviews.first.rating
    puts old_average_rating
    puts rating_exists
    puts average_rating
    puts "*********************"
    average_rating
  end #get_average_rating
end #class
