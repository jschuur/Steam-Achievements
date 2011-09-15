class Thing
  attr_reader :what
  
  def self.initialize(num)
    puts "initializing"
    @what = num
  end
end