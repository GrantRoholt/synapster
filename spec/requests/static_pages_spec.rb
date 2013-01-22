require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'Synapster'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Synapster')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text=> "Synapster")
   end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text=> '| Home')
   end
  end

  describe "Help page" do    

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

 it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text=> "Synapster | Help")
   end
  end



  describe "About page" do
    it "should have the content 'About Us'" do
    visit '/static_pages/about'
    page.should have_selector('h1', :text => 'About Us') 
   end

it "should have the title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text=> "Synapster | About Us")
   end
  end
end
