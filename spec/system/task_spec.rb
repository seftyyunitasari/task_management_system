require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
	describe 'New creation function' do
		context 'When creating a new task' do
			it 'The created task is displayed' do
				task = FactoryBot.create(:task, title: 'task')
				visit tasks_path
				expect(page).to have_content 'task'
			end
		end
	end
	describe 'List display function' do
		context 'When transitioning to the list screen' do
			it 'The created task list is displayed' do
				visit new_task_path
				fill_in "Title", with: "task name"
				fill_in "Detail", with: "task details"
				click_on "submit"
				visit tasks_path
				expect(page).to have_content 'task name'
				expect(page).to have_content 'task details'
			end
		end
	end
	describe 'Detailed display function' do
		context 'When transitioned to any task details screen' do
			it 'The content of the relevant task is displayed' do
				visit new_task_path
				fill_in "Title", with: "task name2"
				fill_in "Detail", with: "task details2"
				click_on "submit"
				visit tasks_path
				click_on "Show"
				expect(page).to have_content 'task name2'
				expect(page).to have_content 'task details2'
			end
		end
		context 'When tasks are arranged in descending order of creation date and time' do
			it 'New task is displayed at the top' do
				task1 = FactoryBot.create(:task, title: 'task1', detail: 'task1_detail')
				task2 = FactoryBot.create(:task, title: 'task2', detail: 'task2_detail')
				visit tasks_path
				task_list = all('.task_row') 
				@tasks = Task.all
				expect(@tasks).to match_array [task2, task1]
			end
		end
	end
end