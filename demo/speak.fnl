(import-macros {: defgeneric} :defgeneric)

(defgeneric speak)

;; To use, you'll need to export the generic method
;; so that can be imported and used in other places.
;; The method also contains the lookup table (as a metatable) for the classes that
;; are registered with it
speak
