require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe '#create' do
    subject { post :create, params: { question: question_attributes } }

    context 'when question attributes is valid' do
      let(:question_attributes) { attributes_for(:question) }

      it 'creates question with passed attributes' do
        expect { subject }.to change(Question, :count).by(1)

        created_question = Question.order(created_at: :desc).first
        expect(created_question.title).to eq(question_attributes[:title])
        expect(created_question.body).to eq(question_attributes[:body])
      end

      it 'redirect to question page' do
        subject

        created_question = Question.order(created_at: :desc).first
        expect(response).to redirect_to(created_question)
      end
    end

    context 'when question attributes is not valid' do
      let(:question_attributes) { attributes_for(:question, :invalid) }

      it 'do not create question' do
        expect { subject }.not_to change(Question, :count)
      end

      it 'render edit page' do
        subject
        expect(response).to render_template(:edit)
      end
    end
  end
end
