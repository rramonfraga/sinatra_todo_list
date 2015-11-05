class Task
  attr_reader :content, :id, :status_complete, :created_at, :update_at
  @@current_id = 1
  def initialize content
    @content = content
    @id = @@current_id
    @@current_id += 1
    @status_complete = false
    @created_at = Time.now
    @update_at = nil
  end

  def completed?
    @status_complete
  end

  def complete!
    @status_complete = true
  end

  def make_incomplete!
    @status_complete = false
  end

  def update_at!
    @update_at = Time.now.strftime("Update at %d/%m/%Y - %R")
  end

  def update_contect! new_contect
    update_at!
    @content = new_contect
  end
end