class WordsController < ApplicationController
  #auto_complete_for :word, :word

  def new
    @title = "New word: #{params[:word]}"
    @languages = Language.all
    @word = Word.new
    @word.word = params[:word] unless params[:word].nil?
  end

  def create
    @word = Word.new params[:word]
    i = 0
    if (@word.save)
      while !params["translation_#{i}"].nil? do
        translation = params["translation_#{i}"]
        relation = WordRelation.create_relation(@word.id, translation, "1")
        unless relation.nil?
          relation.save
        end
        i = i + 1
      end

      redirect_to @word
    else
      render 'pages/message'
    end
  end

  def show
    @word = Word.find(params[:id])
    @title = "Card for word: #{@word.word}"
    @word_relation = WordRelation.new
  end

  def edit
    @word = Word.find(params[:id])
    @title = "Edit word: #{@word.word}"
  end

  def index
    @title = "List of all words"
    @words = Word.all
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(params[:word])
      redirect_to @word
    else
      render 'edit'
    end
  end
end