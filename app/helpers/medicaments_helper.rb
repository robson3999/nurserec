module MedicamentsHelper
  def medicaments_statuses
    [
      [I18n.t('medicaments.ordinable'), :ordinable],
      [I18n.t('medicaments.pursued'), :pursued]
    ]
  end
end
