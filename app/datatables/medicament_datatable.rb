class MedicamentDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :edit_medicament_path, :medicament_path,
                 :medicament_group_path, :html_safe, :raw, :current_user

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      id: { source: 'Medicament.id', cond: :eq },
      name: { source: 'Medicament.name', cond: :like },
      groups: { source: 'Medicament.groups', searchable: false, orderable: false },
      actions: { source: '', searchable: false, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: link_to(record.name, medicament_path(record), class: 'text-dark'),
        groups: raw(medicament_groups(record)),
        actions: raw(medicament_actions(record))
      }
    end
  end

  def get_raw_records
    return medicament_group.medicaments if medicament_group.present?

    Medicament.ordinable
  end

  def medicament_groups(record)
    groups = []
    record.medicament_groups.map do |medicament_group|
      groups << link_to(medicament_group.name, medicament_group_path(medicament_group), class: 'btn btn-sm btn-light')
    end

    groups.join('<br />').html_safe
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
end
