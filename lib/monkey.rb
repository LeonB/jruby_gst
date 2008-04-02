class Array
  def to_h(&block)
    Hash[*self.collect { |v|
      [v, block.call(v)]
    }.flatten]
  end
end