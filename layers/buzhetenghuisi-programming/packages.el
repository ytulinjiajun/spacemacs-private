;;; packages.el --- buzhetenghuisi-programming layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: super user <ljj@localhost.localdomain>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `buzhetenghuisi-programming-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `buzhetenghuisi-programming/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `buzhetenghuisi-programming/pre-init-PACKAGE' and/or
;;   `buzhetenghuisi-programming/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst buzhetenghuisi-programming-packages
  '(
    counsel-gtags
    ycmd
    )
  )

;;; packages.el ends here
(defun buzhetenghuisi-programming/init-counsel-gtags ()
  (use-package counsel-gtags
    :defer t
    :init
    (progn
      (add-hook 'c-mode-hook 'counsel-gtags-mode)
      (add-hook 'c++-mode-hook 'counsel-gtags-mode)

      (with-eval-after-load 'counsel-gtags
        (define-key counsel-gtags-mode-map (kbd "M-g d") 'counsel-gtags-find-definition)
        (define-key counsel-gtags-mode-map (kbd "M-g r") 'counsel-gtags-find-reference)
        (define-key counsel-gtags-mode-map (kbd "M-g s") 'counsel-gtags-find-symbol)
        (define-key counsel-gtags-mode-map (kbd "M-g b") 'counsel-gtags-go-backward))
      )))

(defun buzhetenghuisi-programming/post-init-ycmd ()
  (setq ycmd-server-command (list "python" (file-truename "~/.spacemacs.d/layers/local/ycmd/ycmd/__main__.py")))
  (set-variable 'ycmd-global-config "~/workspace/project/stm32/.ycm_extra_conf.py")
  ;; (set-variable 'ycmd-extra-conf-whitelist '("~/.spacemacs.d/layers/buzhetenghuisi-programming/local/ycmd-extra-conf-list/*"))
  (setq ycmd-force-semantic-completion t)
  )
;;; packages.el ends here
