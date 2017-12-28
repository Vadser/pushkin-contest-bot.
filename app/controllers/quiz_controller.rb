class QuizController < ApplicationController
def index
@coming = Array.new
@names= Array.new
@a=params
@b
search
@param={'question'=>@a[:question],'answer'=>@b}
@article = Article.new({ :question=>@a[:question],:answer=>@b})
@article.save
@articles = Article.all
answer
end
def answer
uri = URI("http://pushkin.rubyroidlabs.com/quiz")
param = {
 answer: @b,
 token: 'fc6787217b59566f1bee76ee5d8543ab',
 task_id:  @a[:id]
}
Net::HTTP.post_form(uri, param)
end
def get_out
  agent = Mechanize.new
  url = 'http://rupoem.ru/pushkin/all.aspx'
  pars(agent.get(url))
  @names
  @coming
end
def pars(page)
  page.css('.poem-text').each do |x|
    @coming<< x.text
  end
 page.css('.poemtitle').each do |x|
    @names<< x.text
  end

end
def search
  get_out
  i=0
  if @a[:question]!=nil
  @coming.each do |item|
  if item.include?(@a[:question])
   @b= @names[i]
  else
   i=i+1
  end
 end
end
end
end
