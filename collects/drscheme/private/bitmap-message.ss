#lang scheme

(require mred/mred)
(provide bitmap-message%)

(define bitmap-message%
  (class canvas%
    (inherit min-width min-height get-dc)
    (define bm #f)
    (define/override (on-paint)
      (when bm
        (let ([dc (get-dc)])
          (send dc draw-bitmap bm 0 0))))
    (define/public (set-bm b)
      (set! bm b)
      (min-width (send bm get-width))
      (min-height (send bm get-height)))
    (super-new (stretchable-width #f)
               (stretchable-height #f))))