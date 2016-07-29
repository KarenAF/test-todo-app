require 'rails_helper'

RSpec.describe List, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe '#complete_all_tasks!' do
    it 'should mark all tasks from the list as complete' do
      list = List.create(name: "Chores")
      task1 = Task.create(complete: false, list_id: list.id, name: "Take out the trash")
      task2 = Task.create(complete: false, list_id: list.id, name: "Mow the lawn")
      list.complete_all_tasks!
      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end
    end

      # list = List.new(name: "Chores")
      # list.save
      # task1 = Task.new(complete: false, list_id: list.id, name: "Take out the trash")
      # task1.save
      # task2 = Task.new(complete: false, list_id: list.id, name: "Mow the lawn")
      # task2.save
      # list.complete_all_tasks!
      # list.tasks.each do |task|
      #   expect(task.complete).to eq(true)
      # end      
  end

  describe '#snooze_all_tasks!' do
    it 'should extend the deadline of all tasks by an hour' do
      list = List.create(name: "Chores")
      task1 = Task.create(list_id: list.id, deadline: '2000-01-01 00:00:00')
      task2 = Task.create(list_id: list.id, deadline: '2000-01-01 00:00:00')
      list.snooze_all_tasks!
      list.tasks.each do |task|
        expect(task.deadline).to eq('2000-01-01 01:0:00')
      end
    end
  end

  describe '#total_duration' do
    it 'should return the total duration of all tasks' do 
      list = List.create(name: "Chores")
      task1 = Task.create(list_id: list.id, duration: 30)
      task2 = Task.create(list_id: list.id, duration: 30)
      expect(list.total_duration).to eq(60)
    end
  end 

  describe '#incomplete_tasks' do
    it 'should display all incomplete tasks' do
      list = List.create(name: "Chores")
      task1 = Task.create(list_id: list.id, complete: false)
      task2 = Task.create(list_id: list.id, complete: false)
      expect(list.incomplete_tasks).to eq([task1, task2])
    end
  end

  describe '#favorite_tasks' do
    it 'should return an array of all tasks that are favorited' do
      list = List.create(name: "Chores")
      task1 = Task.create(list_id: list.id, favorite: false)
      task2 = Task.create(list_id: list.id, favorite: true)
      expect(list.favorite_tasks).to eq([task2])
    end
  end


end
