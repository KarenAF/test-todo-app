require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do
  # pending "add some examples to (or delete) #{__FILE__}"    
    it 'should switch complete to false if it began as true' do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it 'should switch complete to true if it began as false' do
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end    
  end
##########################################
  describe '#toggle_favorite!' do
    it 'should unfavorite a favorite task and favorite unfavorited tasks' do
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end

    it 'should unfavorite a favorite task and favorite unfavorited tasks' do
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end
##########################################
describe '#overdue?' do
  it 'should indicate true if an incomplete task is overdue' do
    task = Task.new(deadline: '2000-01-01 00:00:00') #deadline: 1.day.ago
    task.overdue?
    expect(task.overdue?).to eq(true)
  end
  it 'should indicate false if an incomplete task is not yet overdue' do
    task = Task.new(deadline: '2020-01-01 00:00:00') #deadline: 1.day.from_now
    task.overdue?
    expect(task.overdue?).to eq(false)
  end  
end
##########################################
  describe '#increment_priority!' do
    it "should increase a task's priority rating by 1 if it is 9 or lower" do
      task = Task.new(priority: 1)
      task.increment_priority!
      expect(task.priority).to eq(2)
    end
  end
##########################################
  describe '#decrement_priority!' do
    it "should decrease a task's priority rating by 1 if it is 1 or higher" do
      task = Task.new(priority: 2)
      task.decrement_priority!
      expect(task.priority).to eq(1)
    end
  end
##########################################
  describe '#snooze_hour!' do
    it "should extend a task's deadline by an hour" do
      task = Task.new(deadline: '2000-01-01 00:00:00')
      task.snooze_hour!
      expect(task.deadline).to eq('2000-01-01 01:00:00')
    end
  end
end
