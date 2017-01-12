class HomeController < ApplicationController
  def index
  end
  
  def list
      @list_country = request.location.country
      temp = params[:button]
      if params[:search]
        @every_post = Post.search(params[:search]).where(country: request.location.country).order("id desc").paginate(:page => params[:page])
      else
        if temp == "1"
          @every_post = Post.where(filter: "1").order("id desc").paginate(:page => params[:page]) 
        else
          @every_post = Post.where(country: request.location.country).where(filter: "0").order("id desc").paginate(:page => params[:page])   
        end
      end

  end
  def count
    @every_post = Post.find(params[:id])
    @every_post.clicks = params[:count_test]
    @every_post.save
    
  #   count = @every_post.clicks+1
  #   @every_post.update_attributes(:clicks=> count)
  #   #other code
  end
    
    #국가가 사용자의 국가인 DB만 가져옴, 늦게 만들어진 순서대로 정렬, 10개 초과 시 페이지 나누기
    
  
  def create
    
    @create_city = request.location.city
    @create_country = request.location.country
    @trip_select = [*1..38].sample
    
  end
  def write
      new_post = Post.new
      new_post.title = params[:title]
      new_post.content = params[:content]
      new_post.people = params[:people]
      new_post.address = params[:address].split('/').last 
      #주소를 불러올때 /로 분할하여 맨 마지막 것을 가져와라
      new_post.country = params[:country]
      new_post.filter = params[:filter]
      new_post.image = params[:image]
      new_post.save
      
      redirect_to :root
  end
  def admin
    
  end
  
  def admin_access_hjh_9294
    if temp = "ghkdwlwnsgur123"
    @every_post = Post.all
    else redirect_to "home/admin"
    end
  end
  
  def delete
    delete_post = Post.find(params[:id])
    delete_post.destroy
    
    redirect_to "home/admin_access_hjh_9294"
  end
end
