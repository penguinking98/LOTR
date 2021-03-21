class Lord_of_the_Rings::Book

    attr_accessor :name 
  @@all = []

  def initialize(attrs)
    set_int_id
    attrs_from_hash(attrs)
    save
  end

  def set_int_id 
    @int_id = @@all.length + 1
  end

  def self.new_from_collection(book)
    book.each do |attrs|
        new(attrs)
    end 
  end

  def attrs_from_hash(attrs)
    attrs.each do |k, v|
        send("#{k}=", v)
    end
  end

  def self.get_book
    Lord_of_the_Rings::Book.get_book
    all
  end

  def self.all
    get_book if @@all == []
    @@all
  end

  def save 
    @@all << self
  end 

  def self.find_by_id(input)
    all.find{|s| s.int_id == input.to_i}
  end
end 