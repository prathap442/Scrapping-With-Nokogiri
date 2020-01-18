require 'csv'
class AptQuestion < ApplicationRecord
  def self.export_csv(apt_questions)
    CSV.generate do |csv|
      columns = %w(question answer category difficulty question_type is_public options)
      csv << columns
      apt_questions.each do |apt_question|
        csv << apt_question.attributes.values_at(*columns)
      end
    end
  end
end
