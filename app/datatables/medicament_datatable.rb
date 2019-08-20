class MedicamentDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :edit_medicament_path, :medicament_path, :medicament_group_path, :html_safe, :raw

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
        name: record.name,
        groups: raw(medicament_groups(record)),
        actions: raw(medicament_actions(record))
      }
    end
  end

  def get_raw_records
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
    actions << link_to('Edycja', edit_medicament_path(record), class: 'btn btn-sm')
    actions << link_to('Usuń', medicament_path(record), class: 'btn btn-sm btn-danger', data: { confirm: 'Czy na pewno chcesz usunąć ten lek?' },
                       method: :delete)

    actions.join('<br />').html_safe
  end
end
