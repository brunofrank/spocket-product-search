class ProductsSearchService
  def initialize(query, sort_by, filter)
    @query = query.blank? ? '*' : query
    @sort_by = sort_by
    @filter = filter
  end

  def call
    Product.search(query, search_params.merge(debug: false))
  end

  private

  attr_accessor :query, :sort_by, :filter

  def fields
    ['title^2', 'description', 'country', 'tags', 'price']
  end

  def search_params
    {
      fields: fields,
      order: order
    }.merge(filter_params)
  end

  def order
    case sort_by
    when 'newest'
      { created_at: :desc }
    when 'lowest_price'
      { price: :asc }
    when 'highest_price'
      { price: :desc }
    else
      {}
    end
  end

  def filter_params
    if filter.present?
      field, value = filter.split('=')
      {
        where: {
          field => value
        }
      }
    else
      {}
    end
  end
end
