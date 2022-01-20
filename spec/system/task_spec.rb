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
		context 'When Sort by deadline link is clicked' do
			it 'Task are sorted based on deadline in descending' do
				task1 = FactoryBot.create(:task, title: 'task1', detail: 'task1_detail', deadline: "2022-01-31")
				task2 = FactoryBot.create(:task, title: 'task2', detail: 'task2_detail', deadline: "2022-02-1")
				visit tasks_path
				click_on "Sort by deadline"
				task_list = all('.task_row') 
				@tasks = Task.all
				expect(@tasks).to match_array [task1, task2]
			end
		end
		context "When you click the link to sort by priority" do
			it "a list of tasks sorted in order of priority is displayed" do
				task1 = FactoryBot.create(:task, title: 'task1', detail: 'task1_detail', priority: 1)
				task2 = FactoryBot.create(:task, title: 'task2', detail: 'task2_detail', priority: 2)
				task3 = FactoryBot.create(:task, title: 'task3', detail: 'task3_detail', priority: 3)
				visit tasks_path
				click_on "Sort by priority"
				@tasks = Task.all
				expect(@tasks).to match_array [task1, task2, task3]
			end
		end
	end

	describe 'Search function' do
		before do
			FactoryBot.create(:task, title: "task1 title test", detail: "task1 detail test", status: "started")
			FactoryBot.create(:task, title: "task2 title test", detail: "task2 detail test", status: "completed")
		end
		context 'If you do a fuzzy search by Title' do
			it "Filter by tasks that include search keywords" do
				visit tasks_path
				fill_in "Search by task title", with: "task1"
				click_on "search"
				expect(page).to have_content 'task1'
			end
		end
		context 'When you search for status' do
			it "Tasks that exactly match the status are narrowed down" do
				visit tasks_path
				select('started', from: 'Search by Status')
				click_on "search"
				expect(page).to have_content 'started'
			end
		end
		context 'Title performing fuzzy search of title and status search' do
			it "Narrow down tasks that include search keywords in the Title and exactly match the status" do
				visit tasks_path
				fill_in "Search by task title", with: "task1"
				select('started', from: 'Search by Status')
				expect(page).to have_content 'task1'
				expect(page).to have_content 'started'
			end
		end
	end
end