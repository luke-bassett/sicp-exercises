#lang sicp
#|
Applicative order will lead to an infinite loop as it tries to expand p (the
argument) before evaluating the operand. Normal order will evaluate the operand
first, and thus never try to expand the argument (p) since it's ignored by the
conditional. Applicitive order is default, but normal order is used for conditional
operators.
|#