module SubCreator
  def save_am_subs
    subs = @am_subs.map!{ |fields| AmericanSubscription.new(fields) }
    results = AmericanSubscription.import subs, validate: false

    if !results.failed_instances.empty?
      binding.pry
    end
  end

  def save_subs
    subs = @subs.map!{ |fields| Subscription.new(fields) }
    results = Subscription.import subs, validate: false

    if !results.failed_instances.empty?
      binding.pry
    end
  end

  def save_invalid_subs
    subs = @invalid_subs.map!{ |fields| InvalidSubscription.new(fields) }
    results = InvalidSubscription.import subs, validate: false

    if !results.failed_instances.empty?
      binding.pry
    end
  end
end