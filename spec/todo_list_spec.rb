require_relative '../lib/todo_list.rb'
require_relative '../lib/task.rb'

RSpec.describe "TodoList" do
  before :all do
    @todo_list = TodoList.new("Josh")
    @task = Task.new("Buy the milk")
    @task2 = Task.new "Walk the dog"
    @todo_list.add_task @task2
  end

  describe "#add_task" do
    it "should return the task that you add to the todo list" do
      expect(TodoList.new("Rafa").add_task(nil)).to eq([nil])
    end
    it "should return the task that you add to the todo list" do
      expect(@todo_list.add_task(@task)).to eq(@todo_list.tasks)
    end
  end


  describe "#find_task_by_id" do
    it "should return nothing if the arent this @id in the list" do
      tasks = Array.new(@todo_list.tasks)
      expect(@todo_list.find_task_by_id -1).to eq(nil)
    end
    it "should return the this @id in the list" do
      expect(@todo_list.find_task_by_id(@task.id)).to eq(@task)
    end
  end

  describe "#sort_tasks" do
    it "should return an the task with the same size" do
      expect(@todo_list.sorted_by_created("DESC").size ).to eq(@todo_list.tasks.size)
    end
    it "should return a different task array" do
      tasks = Array.new(@todo_list.tasks)
      expect(@todo_list.sorted_by_created "ASC").not_to eq(tasks)
    end
  end


  describe "#delete_task" do
    it "should return nothing if the arent this @id in the list" do
      expect(@todo_list.delete_task @task.id).to eq(@todo_list.tasks)
    end
    it "should return the same array if the arent this @id in the list" do
      tasks = Array.new(@todo_list.tasks)
      expect(@todo_list.delete_task -1).to eq(tasks)
    end
  end

=begin
  describe "#show_tasks" do
    it "should return a list of tasks names" do
      expect(@todo_list.show_tasks).to eq(@task2.content + "\n")
    end
  end
=end

end