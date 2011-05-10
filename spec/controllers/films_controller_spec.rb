require File.dirname(__FILE__) + '/../spec_helper'

describe FilmsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Film.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Film.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Film.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(film_url(assigns[:film]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Film.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Film.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Film.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Film.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Film.first
    response.should redirect_to(film_url(assigns[:film]))
  end

  it "destroy action should destroy model and redirect to index action" do
    film = Film.first
    delete :destroy, :id => film
    response.should redirect_to(films_url)
    Film.exists?(film.id).should be_false
  end
end
