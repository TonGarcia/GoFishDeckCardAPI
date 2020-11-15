class Hash
  def to_obj
    Helpers::HashObject.new self
  end
end