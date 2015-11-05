#Inside of server.rb
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
# We're going to need to require our class files
require_relative('lib/task.rb')
require_relative('lib/todo_list.rb')

todo_list = TodoList.new("Josh")
task = Task.new("Walk the dog")
task2 = Task.new("Buy the milk")
task3 = Task.new("Make my todo list into a web app")
todo_list.add_task(task)
todo_list.add_task(task2)
todo_list.add_task(task3)
#todo_list.save

get "/" do
  redirect("/tasks")
end

get "/tasks" do
  @todo_list = todo_list
  erb(:task_index)
end

get "/new_task" do
  erb(:new_task)
end

post "/create_task" do
  new_task = Task.new(params[:content])
  todo_list.add_task(new_task)
  @todo_list = todo_list
  redirect("/tasks")
end

get "/complete_task/:id" do
  finded_task = todo_list.find_task_by_id(params[:id].to_i)
  finded_task.complete!
  redirect("/tasks")
end

get "/delete_task/:id" do
  binding.pry
  todo_list.delete_task(params[:delete].to_i)
  redirect("/tasks")
end