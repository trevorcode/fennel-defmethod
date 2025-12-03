(import-macros {: defmethod} :defgeneric)
(local speak (require :demo.speak))

(defmethod speak :cat [self]
  (print "meow"))

(fn new [name color]
  {:class :cat
   :name name
   :color color})

{: new}
