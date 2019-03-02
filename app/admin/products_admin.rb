Trestle.resource(:products) do
  menu do
    group :shop_management, priority: :first do
      item :products, icon: "fa fa-shopping-cart"
    end
  end
  
  scope :latest, default: true

  active_storage_fields do
    [:images]
  end

  form do |product|
    tab :product do
      text_field :name
      text_area :description, rows: 5
      active_storage_field :images
      row do
        col(xs: 6) { select :category_id, Category.all.collect {|c| [ c.name, c.id ] }  }
        col(xs: 6) { number_field :pricing, prepend: "$"}
      end
    end

    tab :metadata do
      row do
        col(xs: 6) { datetime_field :updated_at }
        col(xs: 6) { datetime_field :created_at }
      end
    end
  end
end
