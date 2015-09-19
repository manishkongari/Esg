# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ComponentType.create([{name: 'Enclosure'}, {name: 'Crimp Tool'}, {name: 'Disconnect Switch'}, {name: 'Multi-Conductor Cables'},
                      {name: 'Circuit Protection'},{name: 'Wire Guage'},{name: 'Pilot Devices'},{name: 'Shielding'},
                      {name: 'Power Supply'},{name: 'Connectors-Male'},{name: 'Terminal Block'},{name: 'Connectors-Female'},
                      {name: 'Panel-Mount Receptacles'},{name: 'Pins'},{name: 'VFD'},{name: 'PLC-CPU'},{name: 'Servo/Stepper'},
                      {name: 'Display'},{name: 'Solar Panels'},{name:'Sockets'},{name:'VFD Remote Display'},
                      {name:'PLC Modules-Digital Inputs'},{name:'PLC Modules-Digital Outputs'},{name:'PLC Modules-Analog Inputs'},
                      {name:'PLC Modules-Analog Outputs'},{name:'PLC Modules-Speciality'},
                      {name: 'Power Cables'},{name: 'Battery Pack'},{name: 'Heat Shrink'},{name: 'Bypass Contactor'},{name: 'Feedback Cables'},
                      {name: 'Nodes Transmitter'},{name: 'External Encoder'},{name: 'External Encoders'},{name: 'Nodes Receiver'},
                      {name: 'HMI'},{name: 'HMI Communication'},{name: 'VFD/Servo/Stepper Drives'},{name: 'Safety Relay'},
                     ])