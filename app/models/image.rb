class Image
  def self.get(id)
    house_images[id % house_images.length]
  end

  def self.house_images
    ["gryffindor.png", "ravenclaw.png", "slytherin.png",
     "hufflepuff.png", "gryffindor.png"]
  end
end
