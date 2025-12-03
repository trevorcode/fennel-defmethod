
# fennel defgeneric/defmethod

Inspired sorta by clojure multimethods and common lisp CLOS methods.

The approach is not meant to be a clojure multimethod, because for gamedev we often need quicker dispatches than the very flexible/dynamic nature.  So we borrow a little bit from CLOS. (just a bit).

```clojure
(import-macros {: defgeneric : defmethod} :defgeneric)

(defgeneric speak)

(defmethod speak :dog [self]
  (print "bark!"))

(defmethod speak :cat [self]
  (set self.age 9)
  (print "meow!"))

(local dog {:class :dog
            :color :brown
            :age 5})

(local cat {:class :cat
            :color :orange
            :age 7})

(speak cat)
;;=> meow!
(speak dog)
;;=> bark!
```

# How to use

After importing the macros:

```clojure
(import-macros {: defgeneric : defmethod} :defgeneric)
```

Define a generic method

```clojure
(defgeneric speak)
```

What this does is it returns a function that can be called named `speak`. This function has a dispatch table (hidden in a metatable) that will search for any classes that are registered to the `speak` method.

You can export the method/function normally.

Next, register a class to implement the method

```clojure
(defmethod speak :dog [self]
  (print "bark!"))
```

The first variable will always be the table of the class. Now that this is registered to the speak method, any table passed into the method that contains `dog` as the `class` will run the method.

```clojure
(local dog {:class :dog
            :color :brown
            :age 5})

(speak dog)
;;=> bark!
```

The `demo` folder in this repo showcases how this works across multiple modules.


# Benefits

Mainly separation of state and behavior.

This allows a user reload the defmethods at the repl. 

There is a slight "overhead" to this but it's roughly 0.3 seconds slower over 9 million invocations compared to a regular metatable call. (with my computer)

I can easily serialize my entities/objects because they don't have inherent methods attached to them, and object creation is faster since I don't need to attach a metatable to them so it can somewhat offset the slowdown by using the defgeneric/defmethod.

