Trestle.resource(:events) do
  menu do
    group :shop_management do
      item :events, icon: "fa fa-calendar"
    end
  end

  active_storage_fields do
    [:image]
  end

  form do |product|
    tab :event do
      text_field :name
      text_area :details, rows: 5
      text_field :location
      active_storage_field :image

      row do
        col(xs: 6) { datetime_field :starts_at }
        col(xs: 6) { datetime_field :ends_at }
      end
    end

    tab :metadata do
      row do
        col(xs: 6) { datetime_field :updated_at }
        col(xs: 6) { datetime_field :created_at }
      end
    end
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |event|
  #   text_field :name
  #
  #   row do
  #     col(xs: 6) { datetime_field :updated_at }
  #     col(xs: 6) { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:event).permit(:name, ...)
  # end
end
