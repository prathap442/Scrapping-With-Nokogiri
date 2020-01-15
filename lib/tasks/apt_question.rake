require 'nokogiri'
require 'open-uri'
namespace :apt_question do
  desc "trains"
  task trains: :environment do
    doc = Nokogiri::HTML(open("https://www.freshersnow.com/time-and-distance-aptitude-quiz"))
    doc.css("div[class='watu-question ']").each do |ques_content|
      apt_question = AptQuestion.new(
        question: '',
        answer: '',
        category: 'aptitude',
        difficuly: 'medium',
        question_type: 'Mutliple Choice',
        options: '',
        is_public: true
      )
      answer_suffix_removers = ["A. ","B. ","C. ","D. "]
      apt_question[:question] = ques_content.css('div[class="question-content"]')[0].children[1].text
      ques_content.css("div[class='question-choices watupro-choices-columns']")[0].css('label[class=" answer"]').each_with_index do |all_options_div, option_index|        
        delimeter_splitation = answer_suffix_removers[option_index]
        option_framer = all_options_div.css('span').text.split(delimeter_splitation)
        option_framer.shift
        option_framed = option_framer.join(delimeter_splitation)
        apt_question[:options] += option_framed+','
      end
      apt_question[:options] = apt_question[:options].chomp(',')
      puts apt_question.attributes
      apt_question.save
    end   
  end

  desc "time and distance"
  task time_and_distance: :environment do
  end
end
