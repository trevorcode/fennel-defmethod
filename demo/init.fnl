(local speak (require :demo.speak))
(local dog-module (require :demo.dog))
(local cat-module (require :demo.cat))

(local dog (dog-module.new "Fido" "Brown"))

(local cat (cat-module.new "Garfield" "Orange"))

(each [_ o (ipairs [cat dog])]
  (speak o))
(speak cat)
(speak dog)
