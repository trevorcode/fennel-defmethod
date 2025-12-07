(import-macros {: deftrait : deftype : impl} :deftrait)

(deftrait Moveable move)
(deftrait Drawable draw)

(deftype Enemy)

(impl Enemy Moveable
      [move (fn [self]
              (set self.x (+ self.x self.vx))
              (set self.y (+ self.y self.vy)))])

(impl Enemy
      [stand-alone-fn (fn [] (print "Can implement a function on a type standalone"))])

(impl Enemy Drawable
      [draw (fn [self] (print "DRAWING"))]
      [extra (fn [self] (print "An extra function can exist on a trait implementation"))])

(local e (Enemy:new {:x 50 :y 50 :vx 5 :vy 5}))

(e:move)

;; Iterable example

(deftype MyList)

(set MyList.new
     (fn [lst]
       (setmetatable {:list lst
                      :pointer 1} MyList)))

(deftrait Iterable
  reset
  next
  done?)

(impl MyList Iterable
      [reset (fn [self] (set self.pointer 1))]
      [next (fn [self]
              (let [val (. self.list self.pointer)]
                (when val 
                  (set self.pointer (+ self.pointer 1)))
                val))]
      [done? (fn [self]
               (not (. self.list self.pointer)))])

(local my-list (MyList.new [1 2 3 4]))

(my-list:next)
(my-list:next)
(my-list:next)
(my-list:next)
(my-list:done?)
(my-list:reset)


