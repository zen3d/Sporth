(define prop "++2(-+)")
(ps-parse 0 "120")
(ps-push-string 0 prop)
;(ps-parse 0 "120 '++2(-+)' prop 0.001 0.1 0.3 tenvx 1000 0.5 sine *")
(ps-parse 0 "prop 0.001 0.1 0.3 tenvx 1000 0.5 sine *")
(ps-init-sporthlet 0)
(ps-turnon 0)
