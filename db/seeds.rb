# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# GRUPY LEKÓW

MEDICAMENT_GROUPS_NAMES = [
  'leki przeciwwymiotne',
  'leki przeciwzakaźne do stosowania miejscowego',
  'ginekologiczne leki przeciwzakaźne',
  'leki stosowane w niedokrwistości',
  'leki przeciwzakaźne stosowane w chorobach gardła',
  'leki przeciwzakaźne stosowane w chorobach ucha i zatok',
  'leki przeciwzakaźne stosowane w chorobach dróg moczowych',
  'leki przeciwzakaźne stosowane w chorobach przyzębia i tkanki okostnej',
  'leki przeciwzakaźne stosowane w chorobach skóry',
  'środki znieczulające działające miejscowo',
  'leki przeciwbólowe',
  'anksjolityki',
  'leki przeciwpasożytnicze',
  'leki rozszerzające oskrzela',
  'witaminy',
  'płyny infuzyjne'
]

SUBSTANCES_NAMES = [
  'Ondansetronum', 'Aprepitantum', 'Thiethylperazinum',
  'Nystatinum', 'Metronidazolum', 'Natamycinum',
  'Clotrimazolum', 'Acidum Folicum', 'Phenoxymethylpenicillinum',
  'Amoxicillinum', 'Trimethoprim', 'Doxycyclinum',
  'Oxytetracyclinum + Hydrocortisoni Acetas',
  'Lidocainum', 'Lidocainum + Prilocainum',
  'Tramadolum', 'Tramadolum + Paracetamolum',
  'Hydroxyzinum',
  'Mebendazolum', 'Pyrantelum', 'Crotamitonum',
  'Salbutamolum', 'Ipratropii Bromidum',
  'Cholecalciferolum',
  'sól fizjologiczna', 'glukoza 5%', 'płyn Ringera', 'płyn wieloelektrolitowy (PWE)'
]

MEDICAMENT_GROUPS_NAMES.each do |medicament_group_name|
  MedicamentGroup.create(name: medicament_group_name)
end

SUBSTANCES_NAMES.each do |substance_name|
  Substance.create(name: substance_name, status: :ordinable)
end