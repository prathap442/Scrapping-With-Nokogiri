json.extract! apt_question, :id, :question, :answer, :category, :difficuly, :question_type, :is_public, :options, :created_at, :updated_at
json.url apt_question_url(apt_question, format: :json)
