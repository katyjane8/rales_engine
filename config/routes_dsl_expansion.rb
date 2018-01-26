module RoutesDslExpansion

  def collection_of(name, &block)
    namespace name, &block
  end

  def record_of(name, &block)
    namespace plural(name), path: "#{name}s/:#{name}_id", &block
  end

  def belongs_to(*names)
    resource *names, only: :show
  end

  def has_many(*names)
    resources *names, only: :index
  end

  def indexes(*names)
    names.each do |name|
      get *name, to: "#{name}#index"
    end
  end

  def shows(*names)
    names.each do |name|
      get name, to: "#{name}#show"
    end
  end

  def plural(singular)
    singular.to_s.pluralize.to_sym
  end

end
