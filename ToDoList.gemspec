# Define a Task class to represent tasks
class Task
  attr_accessor :name, :completed

  def initialize(name)
    @name = name
    @completed = false
  end

  def mark_as_done
    @completed = true
  end

  def to_s
    status = @completed ? "[X]" : "[ ]"
    "#{status} #{@name}"
  end
end

class TodoList
  def initialize
    @tasks = []
  end



  def add_task(name)
    task = Task.new(name)
    @tasks << task
    puts "Task '#{name}' added to the list."
  end



  def mark_task_as_done(task_index)
    if task_index >= 0 && task_index < @tasks.length
      @tasks[task_index].mark_as_done
      puts "Task marked as done: #{@tasks[task_index]}"
    else
      puts "Invalid task index."
    end
  end

  def view_tasks
    if @tasks.empty?
      puts "No tasks in the list."
    else
      puts "Tasks:"
      @tasks.each_with_index { |task, index| puts "#{index + 1}. #{task}" }
    end
  end


  def start
    loop do
      puts "\n--- Todo List Menu ---"
      puts "1. Add Task"
      puts "2. View Tasks"
      puts "3. Mark Task as Done"
      puts "4. Exit"
      print "Enter your choice: "
      choice = gets.chomp.to_i

      case choice
      when 1
        print "Enter task name: "
        task_name = gets.chomp
        add_task(task_name)
      when 2
        view_tasks
      when 3
        print "Enter task index to mark as done: "
        task_index = gets.chomp.to_i - 1
        mark_task_as_done(task_index)
      when 4
        break
      else
        puts "Invalid choice. Please choose again."
      end
    end
    puts "Exiting Todo List. Goodbye!"
  end


end

# Test the TodoList functionalities
todo_list = TodoList.new
todo_list.start
todo_list.view_tasks
todo_list.view_tasks
