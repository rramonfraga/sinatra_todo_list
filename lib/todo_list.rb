class TodoList
  attr_reader :name, :tasks
  def initialize name
    @name = name
    @tasks = []
  end

  def add_task task
    @tasks.push task
  end

  def delete_task id_task
    @tasks = @tasks.delete_if do |task|
      task.id == id_task
    end
  end

  def find_task_by_id id_task
    @tasks.find do |task|
      task.id == id_task
    end
  end

  def sorted_by_created dirrection
    @tasks.sort do |task1, task2|
      if dirrection == "ASC"
        task1.created_at <=> task2.created_at
      else
        task2.created_at <=> task1.created_at
      end
    end
  end

  def show_tasks
    show = []
    @tasks.each do |task|
      show.push task.content 
    end
    show
  end

  def save
  @todo_store.transaction do 
      @todo_store[@user] = @tasks
  end
end

end