#lang racket

;; ------  Helper Function ---------
;;  converts a string to a number
;;  accounts for negative prefix
(define (my-string->number str)
   (if  (char=? (string-ref str 0) #\-)
        (* -1 (string->number (substring str 1)))
        (string->number str)
        )
  )

;; reads entire file into a string
(define input (port->string (open-input-file "aoc12-input.txt")))


;; regexp-match*:        uses regex to match all number strings  (asterisk means return all matches)
;; my-string->number:   converts strings to numbers (both positive and negative
;; apply:               applies the + function to every number, to sum the list
(apply + (map my-string->number (regexp-match* #rx"([0-9])+|-([0-9])+" input) ))

