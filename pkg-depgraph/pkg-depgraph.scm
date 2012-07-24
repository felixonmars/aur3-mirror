					; pkg-depgraph.scm
					; scj < scj archlinux us >
					; v. 0.2
					;
					; simple scheme program that generates a dot dependency graph.
					; usage: pkg-depgraph [pkg1] .. [pkgN]
					;
					; compile with 'csc pkg-depends.scm'
					; 
(use posix regex extras srfi-1)
(require-extension srfi-69)

(define *db-path* "/var/lib/pacman/local")

(define *graph-style* '())
(define *style* "[color=black]")

(let ((conf-file (string-append (getenv "HOME") "/.config/pkg-depgraph.conf")))
  (if (file-exists? conf-file)
      (load conf-file)))

(define *deps* (make-hash-table))
(define (pkg-name-pattern name)
  (regexp (string-append "^" name "-([A-Za-z0-9]+\\.?)+-[0-9]+$")))

(define *pacman-db* (directory *db-path*))
(define field-sep (regexp "[<>=]+"))

(define (depends-file name)
  (string-append *db-path* "/" (find-pkg name) "/depends"))

(define (find-pkg name)
  (call/cc
   (lambda (return)
     (let ((pkg-pattern (pkg-name-pattern name)))
       (begin
	 (for-each (lambda (s)
		     (if (string-match pkg-pattern s)
			 (return s))
		     #f)
		   *pacman-db*)
	 name)))))

(define (get-deps name)
  (call/cc 
   (lambda (break)
     (let ((dep-file (depends-file name)))
       (define (clean-names li)
	 (map (lambda (s)
		(car (string-split-fields field-sep s #:infix)))
	      li))
       (if (file-exists? dep-file)
	   (clean-names 
	    (get-field "%DEPENDS%" (read-lines dep-file)))
	   (break '()))))))

(define (build-table name)
  (if (not (hash-table-exists? *deps* name))
      (begin 
	(let ((deps (get-deps name)))
	  (hash-table-set! *deps* name deps)
	  (for-each build-table deps)))))

(define (get-field field data)
  (cond ((eq? data '()) '())
	((string=? field (car data))
	 (take-while (lambda (s) (not (= (string-length s) 0))) (cdr data)))
	(else (get-field field (cdr data)))))

(define (gen-dot)
  (begin
    (print "digraph deps {")
    (for-each print *graph-style*)
    (for-each (lambda (pkg)
		(print (string-append "\"" pkg "\" " *style*)))
	      (command-line-arguments))
    (for-each (lambda (pkg)
		(for-each 
		 (lambda (dep) 
		   (print (string-append "\t\"" pkg "\" -> \"" dep "\""))) 
		 (hash-table-ref *deps* pkg)))
	      (hash-table-keys *deps*))
    (print "}")))

(for-each build-table (command-line-arguments))
(gen-dot)
