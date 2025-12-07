(import-macros {: defmethod} :defgeneric)
(local speak (require :demo.speak))

(defmethod speak :dog [self]
  (print "bark!!!!!"))

(fn new [name color]
  {:class :dog
   :name name
   :color color})

{: new}
