module Blending

  after_save :make_juice

  def make_juice
    if self.class.name.eql? Apple
      ## code logic
    end
  end
end