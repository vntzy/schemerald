schemerald
=======================

An implementation of the Scheme R5RS interpreter I wrote in Ruby

Features
=======================

Currently implemented R5RS features include:

* Boolean literals: #t and #f
* Numeric literals for integers, reals, rationals and complexes
* string literals
* Proper and improper lists
* Definition and assignment: <tt>define</tt>, <tt>set!</tt>
* Lambdas
* Conditionals: <tt>if</tt>, <tt>cond</tt>
* Binding constructs: <tt>let</tt>
* Quoting
* Delayed evaluation: <tt>delay</tt> and <tt>force</tt>
* Equivalance predicates: <tt>eqv?</tt>, <tt>eq?</tt>, <tt>equal?</tt>
* Numeric library: <tt>number?</tt>, <tt>complex?</tt>, <tt>real?</tt>,
  <tt>rational?</tt>, <tt>integer?</tt>, <tt>=</tt>, <tt><</tt>, <tt>></tt>, <tt><=</tt>, <tt>>=</tt>,   <tt>zero?</tt>,
  <tt>positive?</tt>, <tt>negative?</tt>, <tt>odd?</tt>, <tt>even?</tt>,
  <tt>max</tt>, <tt>min</tt>, <tt>+</tt>, <tt>*</tt>, <tt>-</tt>, <tt>/</tt>,
  <tt>abs</tt>, <tt>quotient</tt>, <tt>remainder</tt>, <tt>modulo</tt>, <tt>lcm</tt>,
  <tt>floor</tt>, <tt>ceiling</tt>, <tt>sqrt</tt>
* Boolean library: <tt>and</tt>, <tt>or</tt>, <tt>not</tt>, <tt>boolean?</tt>
* List library: <tt>pair?</tt>, <tt>cons</tt>, <tt>car</tt>, <tt>cdr</tt>,
  <tt>set-car!</tt>, <tt>set-cdr!</tt>, <tt>null?</tt>, <tt>list?</tt>, <tt>list</tt>
* Symbol library: <tt>symbol?</tt>, <tt>symbol->string</tt>, <tt>string->symbol</tt>
* String library: <tt>string?</tt>, <tt>string-length</tt>, <tt>string-ref</tt>, <tt>string=?</tt>, <tt>string-ci=?</tt>, <tt>string<?</tt>, <tt>string>?</tt>, <tt>string<=?</tt>, <tt>string>=?</tt>, <tt>string-ci<?</tt>, <tt>string-ci>?</tt>, <tt>string-ci<=?</tt>, <tt>string-ci>=?</tt>, <tt>substring</tt>, <tt>string-append</tt>, <tt>string-copy</tt>
* Control features: <tt>procedure?</tt>, <tt>apply</tt>, <tt>eval</tt>

Installation
=======================

<tt>  gem install schemerald  </tt>

To start a REPL session:

<tt> Interpreter.new.repl  </tt>

Licence
=======================

(The MIT License)

Copyright (C) 2014 Ventsislav Velkov ( vntzyv@gmail.com )

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
