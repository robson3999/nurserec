class MedicamentDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :edit_medicament_path, :medicament_path,
                 :medicament_group_path, :html_safe, :raw, :current_user, :substance_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      id: { source: 'Medicament.id', cond: :eq },
      name: { source: 'Medicament.name', cond: :like },
      status: { source: 'Medicament.status' },
      groups: { source: 'Medicament.medicament_groups', searchable: false, orderable: false },
      substances: { source: 'Substance.name', searchable: true, orderable: false },
      actions: { source: '', searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: link_to("#{record.name} (#{record.description})", medicament_path(record), class: 'text-dark'),
        status: status_badge(record.status),
        groups: raw(medicament_groups(record)),
        substances: raw(medicament_substances(record)),
        actions: raw(medicament_actions(record))
      }
    end
  end

  def get_raw_records
    return medicament_group.medicaments.includes(:substances).references(:substances) if medicament_group.present?

    Medicament.includes(:substances).references(:substances)
  end

  def medicament_groups(record)
    groups = []
    record.medicament_groups.map do |medicament_group|
      groups << link_to(medicament_group.name, medicament_group_path(medicament_group), class: 'btn btn-sm btn-light')
    end

    groups.join('<br />').html_safe
  end

  def medicament_substances(record)
    substances = []
    record.substances.map do |substance|
      substances << link_to(substance.name, substance_path(substance), class: 'btn btn-sm btn-info')
    end

    substances.join('<br />').html_safe
  end

  def medicament_actions(record)
    actions = []
    if current_user&.admin?
      actions << link_to('Edycja', edit_medicament_path(record), class: 'btn btn-sm')
      actions << link_to('Usuń', medicament_path(record), class: 'btn btn-sm btn-danger', data: { confirm: 'Czy na pewno chcesz usunąć ten lek?' },
                         method: :delete)
    end
    actions.join('<br />').html_safe
  end

  def medicament_group_id
    @medicament_group ||= options[:medicament_group_id]
  end

  def medicament_group
    MedicamentGroup.find_by(id: medicament_group_id)
  end

  def status_badge(status)
    css_class = status == 'ordinable' ? 'success' : 'secondary'
    ['<span class="badge badge-', css_class, '">',  I18n.t("medicaments.#{status}"), '</span>'].join.html_safe
  end
end
