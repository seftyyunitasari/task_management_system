require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validation test' do

    context 'If the task Title is empty' do
      it "will be caught in validation" do
        task = Task.new(title: '', detail: 'detail')
        expect(task).not_to be_valid
      end
    end

    context 'If the task details are empty' do
      it 'Validation is caught' do
        task = Task.new(title: 'test_title', detail: '')
        expect(task).not_to be_valid
      end
    end

    context 'If the task Title and details are described' do
      it 'Validation passes' do
        task = Task.new(title: 'test_title', detail: 'test_detail')
        expect(task).to be_valid
      end
    end

  end
end
