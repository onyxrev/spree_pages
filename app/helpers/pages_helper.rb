module PagesHelper
  include Spree::StoreHelper
  include Spree::ProductsHelper  

  def sanitize_for_attribute(string, separator)
      return string.
             mb_chars.
             normalize(:kd).
             gsub(/[^\x00-\x7F]/n,'').
             to_s.gsub(/\A+|\W+/, separator).
             downcase[1..-1] # not 100% sure why this always produces a leading "_"
  end

  def sanitize_for_id(string)
    sanitize_for_attribute(string, "_")
  end

  def sanitize_for_class(string)
    sanitize_for_attribute(string, "-")
  end
end

