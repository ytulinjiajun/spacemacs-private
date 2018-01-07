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
    ;; (cmake-ide :location (recipe
    ;;                       :fetcher github
    ;;                       :repo "dlyr/cmake-ide"))
    cmake-ide
    rtags
    flycheck-rtags
    ivy-rtags
    )
  )

;; packages.el ends here
(defun buzhetenghuisi-programming/init-cmake-ide ()
  (use-package cmake-ide
    :config
    (cmake-ide-setup)
    ))

(defun buzhetenghuisi-programming/init-rtags ()
  (use-package rtags
    :config
    ;; Enable rtags-diagnostics
    (setq rtags-autostart-diagnostics t)

    ;; 在缓冲区中启动一个异步进程，以便每当文件被重新编制索引时从clang接收警告/错误。它集成flymake突出显示警告和错误的代码
    (rtags-diagnostics)

    (require 'company)
    (global-company-mode)

    ;; Enable completions in RTags
    (setq rtags-completions-enabled t)

    ;; Add company-rtags to company-backends
    (push 'company-rtags company-backends)

    (add-hook 'c-mode-hook 'rtags-start-process-unless-running)
    (add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
    (add-hook 'objc-mode-hook 'rtags-start-process-unless-running)

	  (add-hook 'c-mode-hook #'buzhetenghuisi-flycheck-rtags-setup)
    (add-hook 'c++-mode-hook #'buzhetenghuisi-flycheck-rtags-setup)
    (add-hook 'objc-mode-hook #'buzhetenghuisi-flycheck-rtags-setup)

    (add-hook 'c-mode-hook 'flycheck-mode)
    (add-hook 'c++-mode-hook 'flycheck-mode)
    (add-hook 'objc-mode-hook 'flycheck-mode)
    ))

(defun buzhetenghuisi-programming/init-flycheck-rtags ()
  (use-package flycheck-rtags
    :ensure rtags
    ))

(defun buzhetenghuisi-programming/init-ivy-rtags ()
  (use-package ivy-rtags
    :config
    (setq rtags-display-result-backend 'ivy)
    ))
;;; packages.el ends here
