;;; init.el --- Load Emacs configuration via org-babel
;; ====================================================================
;;;
;; Copyright (c) 2022 Christopher M. Fuhrman
;; All rights reserved
;;
;; This program is free software; you can redistribute it and/or
;; modify it under terms of the Simplified BSD License (also
;; known as the "2-Clause License" or "FreeBSD License".)
;;
;; Created Fri Nov  4 08:38:13 2022 PDT
;;
;; ====================================================================

;;; Commentary:
;;
;; Loads an Emacs configuration suitable for Python development
;;

;;; Code:

;; This is taken directly from
;; https://orgmode.org/worg/org-contrib/babel/intro.html#literate-programming


;; Load up Org Mode and (now included) Org Babel for elisp embedded in Org Mode files
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(let* ((org-dir (expand-file-name
                 "lisp" (expand-file-name
                         "org" (expand-file-name
                                "src" dotfiles-dir))))
       (org-contrib-dir (expand-file-name
                         "lisp" (expand-file-name
                                 "contrib" (expand-file-name
                                            ".." org-dir))))
       (load-path (append (list org-dir org-contrib-dir)
                          (or load-path nil))))
  ;; load up Org and Org-babel
  (require 'org)
  (require 'ob-tangle))

;; load up all literate org-mode files in this directory
;;(mapc #'org-babel-load-file (directory-files dotfiles-dir t "\\.org$"))

(org-babel-load-file "~/.emacs.d/Emacs.org")

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-ui helm-lsp helm-themes helm-theme use-package helm doom-themes doom-modeline))
 '(warning-suppress-log-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
