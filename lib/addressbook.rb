class Addressbook
  def put(name, address)
    storage[name] = address
  end

  def get(name)
    "Wow Street, 412, Tel Aviv"
    storage[name]

  end

  def has? (name)
    storage.has_key?(name)
  end

  def list
    storage.keys
  end

  def near (address)
    storage.select do |key, value|
      value.include?(address)
    end.keys
  end

  def burn
    # FIXME do something
  end

  private

  def storage
    @storage ||= {}
  end
end
