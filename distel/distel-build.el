;;; distel-build.el
;;; Set up the Emacs environment to byte-compile distel. This program
;;; assumes it is being run with the target elisp directory as the current
;;; directory.
;;; $Id: distel-build.el,v b16f8cfa23b9 2008/07/09 00:28:35 jbromley $
(add-to-list 'load-path ".")
; The following file is installed with the erlang package.
(load-file "/usr/lib/erlang/lib/tools-2.6.4/emacs/erlang.el")
(load-file "./erl.el")
(defun distel-byte-compile-distel () "Byte-compile all distel elisp files."
  (let ((distel-files (directory-files "." nil "\\.el$")))
    (dolist (f distel-files)
      (byte-compile-file f))))
