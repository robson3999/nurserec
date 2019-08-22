class SubstanceDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :edit_substance_path, :substance_path,
                 :medicament_group_path, :html_safe, :raw, :current_user

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      id: { source: 'Substance.id', cond: :eq },
      name: { source: 'Substance.name', cond: :like },
      status: { source: 'Substance.status' },
      groups: { source: 'Substance.medicament_groups', searchable: false, orderable: false },
      actions: { source: '', searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: link_to(record.name, substance_path(record), class: 'text-dark'),
        status: status_badge(record.status),
        groups: raw(medicament_groups(record)),
        actions: raw(record_actions(record))
      }
    end
  end

  def get_raw_records
    Substance.all
  end

  def medicament_groups(record)
    groups = []
    record.medicament_groups.map do |medicament_group|
      groups << link_to(medicament_group.name, medicament_group_path(medicament_group), class: 'btn btn-sm btn-light')
    end

    groups.join('<br />').html_safe
  end

  def record_actions(record)
    actions = []
    if current_user&.admin?
      actions << link_to('Edycja', edit_substance_path(record), class: 'btn btn-sm btn-light')
      actions << link_to('Usuń', substance_path(record), class: 'btn btn-sm btn-danger', data: { confirm: 'Czy na pewno chcesz usunąć ten lek?' },
                         method: :delete)
    end
    actions.join('<br />').html_safe
  end

  def status_badge(status)
    css_class = status == 'ordinable' ? 'success' : 'secondary'
    ['<span class="badge badge-', css_class, '">',  I18n.t("medicaments.#{status}"), '</span>'].join.html_safe
  end
end
