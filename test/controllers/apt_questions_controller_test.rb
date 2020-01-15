require 'test_helper'

class AptQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apt_question = apt_questions(:one)
  end

  test "should get index" do
    get apt_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_apt_question_url
    assert_response :success
  end

  test "should create apt_question" do
    assert_difference('AptQuestion.count') do
      post apt_questions_url, params: { apt_question: { answer: @apt_question.answer, category: @apt_question.category, difficuly: @apt_question.difficuly, is_public: @apt_question.is_public, options: @apt_question.options, question: @apt_question.question, question_type: @apt_question.question_type } }
    end

    assert_redirected_to apt_question_url(AptQuestion.last)
  end

  test "should show apt_question" do
    get apt_question_url(@apt_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_apt_question_url(@apt_question)
    assert_response :success
  end

  test "should update apt_question" do
    patch apt_question_url(@apt_question), params: { apt_question: { answer: @apt_question.answer, category: @apt_question.category, difficuly: @apt_question.difficuly, is_public: @apt_question.is_public, options: @apt_question.options, question: @apt_question.question, question_type: @apt_question.question_type } }
    assert_redirected_to apt_question_url(@apt_question)
  end

  test "should destroy apt_question" do
    assert_difference('AptQuestion.count', -1) do
      delete apt_question_url(@apt_question)
    end

    assert_redirected_to apt_questions_url
  end
end
