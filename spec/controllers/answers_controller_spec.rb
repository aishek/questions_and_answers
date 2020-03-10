require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe '#create' do
    let(:question) { create(:question) }

    subject { post :create, params: { answer: answer_attributes, question_id: question } }

    context 'when answer attributes is valid' do
      let(:answer_attributes) { attributes_for(:answer) }

      it 'creates answer with passed attributes' do
        expect { subject }.to change(Answer, :count).by(1)

        created_answer = Answer.order(created_at: :desc).first
        expect(created_answer.question).to eq(question)
        expect(created_answer.body).to eq(created_answer[:body])
      end

      it 'redirect to question page' do
        subject

        expect(response).to redirect_to(question)
      end
    end

    context 'when question attributes is not valid' do
      let(:answer_attributes) { attributes_for(:answer, :invalid) }

      it 'do not create answer' do
        expect { subject }.not_to change(Answer, :count)
      end

      it 'render edit page' do
        subject
        expect(response).to render_template(:edit)
      end
    end
  end
end
