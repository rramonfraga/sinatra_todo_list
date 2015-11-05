require_relative '../lib/task.rb'

RSpec.describe "Task" do
  before :all do
    @task = Task.new("Buy the milk")
  end
  
  describe "#completed?" do
    it "should return a @status_complete equal to false" do
      expect(@task.completed?).to eq(false)
    end
  end

  describe "#complete!" do
    it "should return a @status_complete equal to true" do
      expect(@task.complete!).to eq(true)
    end
  end

  describe "#make_incomplete!" do
    it "should return a @status_complete equal to false" do
      expect(@task.make_incomplete!).to eq(false)
    end
  end

  describe "#update_contect!" do
    it "should return the new contect #{"Walk the dog"}" do
      expect(@task.update_contect!("Walk the dog")).to eq("Walk the dog")
    end
    it "should return the @update_at equal to the current time" do
      @task.update_contect!("Walk the dog")
      time = Time.now.strftime("Update at %d/%m/%Y - %R")
      expect(@task.update_at).to eq(time)
    end
  end
end