;;; jde-build.el
;;; Set up the Emacs environment to byte-compile JDEE
;;; $Id: jdee-build.el,v 99d30c485449 2008/06/23 05:38:36 jbromley $
(add-to-list 'load-path "../elib")
(add-to-list 'load-path "../cedet")
(add-to-list 'load-path "./lisp")
(load-file (expand-file-name "../cedet/common/cedet.el"))
(require 'jde)
