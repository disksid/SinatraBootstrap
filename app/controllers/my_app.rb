# coding: utf-8

class MyApp < App
  helpers MyAppHelper

  get '/' do
    erb :index, :locals => {:title => '<Hello>', :entries => Entries.all}
  end

  post '/' do
    Entries.insert(:text => params[:text], :created_at => Time.now)
    erb :index, :locals => {:title => '<Thanks>', :entries => Entries.all}
  end
end
