;;; packages.el --- buzhetenghuisi-org layer packages file for Spacemacs.
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
;; added to `buzhetenghuisi-org-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `buzhetenghuisi-org/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `buzhetenghuisi-org/pre-init-PACKAGE' and/or
;;   `buzhetenghuisi-org/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst buzhetenghuisi-org-packages
  '(
    org
    org-pomodoro
    )
)
;;; packages.el ends here
(defun buzhetenghuisi-org/post-init-org-pomodoro ()
  (setq-default org-pomodoro-length 40)
  )

(defun buzhetenghuisi-org/post-init-org ()
  (with-eval-after-load 'org
    (progn
      ;; 在org-mode下,关闭补全
      (spacemacs|disable-company org-mode)

      ;; 指定my-agenda的搜索路径
      (setq-default org-agenda-files (quote ("~/.my-agenda/GTD")))

      ;;全屏显示agenda
      ;; (setq-default org-agenda-window-setup (quote current-window))

      ;; 优先级范围和默认(A-D)任务的优先级
      (setq org-highest-priority ?A) (setq org-lowest-priority  ?C) (setq org-default-priority ?C)

      ;; 定义任务状态
      (setq org-todo-keywords
            '((sequence "TODO(t)" "WAITTING(w)" "|" "ABORT(a)" "DONE(d)")))

      ;;设置TODO关键词的外观
      (setq org-todo-keyword-faces
            '(("TODO" .      (:foreground "red" :weight bold :underline t))
              ("DONE" .      (:foreground "green" :weight bold :underline t))
              ("ABORT" .     (:foreground "blue" :weight bold :underline t))
              ("WAITING" .   (:foreground "orangered" :weight bold :underline t))
              ))

      ;; 优先级醒目外观
      (setq org-priority-faces
            '((?A . (:foreground "magenta" :weight bold :underline t))
              (?B . (:foreground "orange" :weight bold :underline t))
              (?C . (:foreground "yellow" :weight bold  :underline t))
              ))

      ;; 设置gtd文件的路径
      (defvar org-agenda-dir "" "gtd org files location")
      (setq-default org-agenda-dir "~/.my-agenda/GTD")

      ;; 定制博客
      (setq agenda-work (expand-file-name "Work.org" org-agenda-dir))
      (setq agenda-life (expand-file-name "Life.org" org-agenda-dir))
      (setq agenda-blog-plan (expand-file-name "Blog-Plan.org" org-agenda-dir))

      (setq org-agenda-files (list org-agenda-dir))

      (setq org-capture-templates
            '(("t" "Work					工作相关的待办事项" entry (file+headline agenda-work "Work-Agenda")
               "* TODO [#A] Case:%^{}%? :@KeyWords:\n\t详情:略~\nCase creation time:%U %i\n"
               :empty-lines 0)
              ("l" "Life					生活相关的待办事项" entry (file+headline agenda-life "Life-Agenda")
               "* TODO [#B] Case:%^{}%? :@KeyWords:\n\t详情:略~\nCase creation time:%U %i\n"
               :empty-lines 0)
              ("p" "Blog-plans    博客计划" entry (file+headline agenda-blog-plan "Blog-Plans-Agenda")
               "* TODO [#C] Case:%^{}%? :@KeyWords:\n\t详情:略~\nCase creation time:%U %i\n"
               :empty-lines 0)))

      (setq org-agenda-custom-commands
            '(("p" . "---------------按 Priority 匹配-------------------")
              ("pa" "------TODO--A------------" tags-todo "+PRIORITY=\"A\"") 
              ("pb" "------TODO--B------------" tags-todo "+PRIORITY=\"B\"") 
              ("pc" "------TODO--C------------" tags-todo "+PRIORITY=\"C\"") 

              ;; ("v" . "---------------State----------------------")
              ;; ("vt" "-------TODO--------------" tags "+TODO=\"TODO\"")
              ;; ("vd" "-------DONE--------------" tags "+TODO=\"DONE\"")
              ;; ("va" "-------ABORT-------------" tags "+TODO=\"ABORT\"")
              ;; ("vw" "-------WAITING-----------" tags "+TODO=\"WAITTING\"")
              ;; )
            ))
      )))
