(use-modules (oop goops) (rnrs) (ice-9 colorized))
 (colorize-it
  `(this-is-a-symbol 1 2.5 2/5 #\c "asdf" ,(lambda () #t) ,(cons 1 2) ,
                     (vector 1 2 3) #2u32@2@3((1 2) (3 4)) ,(make-bytevector 10 99) ,<object>))
