class String
  unless "".respond_to? :camelize
    def camelize
      split('_').map { |w| w.capitalize }.join
    end
  end
end
