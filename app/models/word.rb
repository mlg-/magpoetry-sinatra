class Word

attr_accessor :word, :part_of_speech

  def initialize(word, part_of_speech, flarf=false)
    @word = word
    @part_of_speech = part_of_speech
    @flarf = flarf
  end

end
