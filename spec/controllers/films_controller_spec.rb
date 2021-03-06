require File.dirname(__FILE__) + '/../spec_helper'

describe FilmsController do

  it "index action should render index template" do
    Film.expects(:all).returns([])
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    film=Factory(:film)
    Film.expects(:find).with(film.id).returns(film)
    get :show, :id => film.id
    response.should render_template(:show)
  end

  describe 'admins actions' do
    
    before(:each) do
      sign_in :admin, Factory(:admin)
    end
    
    it "new action should render new template" do
      film=Factory.build(:film)
      Film.expects(:new).returns(film)
      get :new
      response.should render_template(:new)
    end

    it "create action should render new template when model is invalid" do
      film=Factory.build(:film)
      Film.expects(:new).with('x' =>'x').returns(film)
      film.expects(:save).returns(false)
      post :create, :film => {'x' =>'x'}
      response.should render_template(:new)
    end

    it "create action should redirect when model is valid" do
      film=Factory(:film)
      Film.expects(:new).with('x' =>'x').returns(film)
      film.expects(:save).returns(true)
      post :create, :film => {'x' =>'x'}
      response.should redirect_to(film_url(assigns[:film]))
    end

    it "edit action should render edit template" do
      film=Factory(:film)
      Film.expects(:find).with(film.id).returns(film)
      get :edit, :id => film.id
      response.should render_template(:edit)
    end

    it "update action should render edit template when model is invalid" do
      film=Factory(:film)
      Film.expects(:find).with(film.id).returns(film)
      film.expects(:update_attributes).with('x' =>'x').returns(false)
      put :update, :id => film.id, :film => {'x' =>'x'}
      response.should render_template(:edit)
    end

    it "update action should redirect when model is valid" do
      film=Factory(:film)
      Film.expects(:find).with(film.id).returns(film)
      film.expects(:update_attributes).with('x' =>'x').returns(true)
      put :update, :id => film.id, :film => {'x' =>'x'}
      response.should redirect_to(film_url(assigns[:film]))
    end

    it "destroy action should destroy model and redirect to index action" do
      film = Film.create(:name=>"Film 1",:url=>"http://www.some.com",:description=>"descrption",:rating=>3)
      lambda do
        delete :destroy, :id => film.id
        response.should redirect_to(films_url)
      end.should change(Film,:count).by(-1)
    end
  end
end
