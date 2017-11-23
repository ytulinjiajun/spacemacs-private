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
      (setq-default org-agenda-files (quote ("~/.my-agenda")))

      ;;全屏显示agenda
      ;; (setq-default org-agenda-window-setup (quote current-window))

      ;; 优先级范围和默认(A-D)任务的优先级
      (setq org-highest-priority ?A) (setq org-lowest-priority  ?C) (setq org-default-priority ?C)

      ;; 定义任务状态
      (setq org-todo-keywords
            '((sequence "TODO(t!)" "WAITTING(w@/!)" "|" "ABORT(a@/!)" "DONE(d@/!)")))

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
      (setq-default org-agenda-dir "~/.my-agenda")

      ;; 定制博客
      (setq org-agenda-file-work (expand-file-name "work.org" org-agenda-dir))
      (setq org-agenda-file-life (expand-file-name "life.org" org-agenda-dir))
      (setq org-agenda-file-blog (expand-file-name "blog.org" org-agenda-dir))
      
      (setq blogs-linux-active (expand-file-name "blogs-linux-active.org" org-agenda-dir))
      (setq blogs-linux-arch1  (expand-file-name "blogs-linux-arch1.org" org-agenda-dir))
      (setq blogs-linux-arch2  (expand-file-name "blogs-linux-arch2.org" org-agenda-dir))


      (setq blogs-emacs-active (expand-file-name "blogs-emacs-active.org" org-agenda-dir))

      (setq blogs-makefile-active (expand-file-name "blogs-makefile-active.org" org-agenda-dir))

      (setq blogs-git-active (expand-file-name "blogs-git-active.org" org-agenda-dir))
      
      (setq blogs-stm32f4-active (expand-file-name "blogs-stm32f4-active.org" org-agenda-dir))

      (setq blogs-stm32f7-active (expand-file-name "blogs-stm32f7-active.org" org-agenda-dir))

      (setq blogs-s3c2440-active (expand-file-name "blogs-s3c2440-active.org" org-agenda-dir))

      (setq blogs-python-active (expand-file-name "blogs-python-active.org" org-agenda-dir))

      (setq blogs-raspberry-pi-active (expand-file-name "blogs-raspberry-pi-active.org" org-agenda-dir))
 
      (setq blogs-C-active (expand-file-name "blogs-c-active.org" org-agenda-dir))

      (setq blogs-Cpp-active (expand-file-name "blogs-cpp-active.org" org-agenda-dir))

      (setq blogs-Mysql-active (expand-file-name "blogs-mysql-active.org" org-agenda-dir))

      (setq blogs-qt-active (expand-file-name "blogs-qt-active.org" org-agenda-dir))

      (setq blogs-tcp-ip-active (expand-file-name "blogs-tcp-ip-active.org" org-agenda-dir))

      (setq blogs-linux-kernel (expand-file-name "blogs-linux-kernel.org" org-agenda-dir))

      (setq blogs-cmake-active (expand-file-name "blogs-cmake-active.org" org-agenda-dir))

      (setq blogs-cmake-to-stm32-active (expand-file-name "blogs-cmake-to-stm32-active.org" org-agenda-dir))

      (setq org-agenda-files (list org-agenda-dir))

      ;; 配置模板
      (setq org-capture-templates
            '(("t" "Work					工作相关的待办事项" entry (file+headline org-agenda-file-work "My-Work")
               "* TODO [#A] Theme:%^{}%? :@Work:\n\t详情:略~\nCase creation time:%U %i\n"
               :empty-lines 0)
              ("l" "Life					生活相关的待办事项" entry (file+headline org-agenda-file-life "My-Life")
               "* TODO [#B] Theme:%^{}%? :@Life:\n\t详情:略~\nCase creation time:%U %i\n"
               :empty-lines 0)
              ("p" "Blog-plan     博客计划" entry (file+headline org-agenda-file-blog "My-Blog-Task")
               "* TODO [#C] Theme:%^{}%? :@Blog:\n\t详情:略~\nCase creation time:%U %i\n"
               :empty-lines 0)

              ("b" "Blog					写博客")
              ("ba" "blogs-linux				有关linux的博客" entry (file+headline blogs-linux-active "blogs-linux-active")
               "* WAITTING Theme:%^{} :@Linux:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bb" "blogs-emacs				有关emacs的博客" entry (file+headline blogs-emacs-active "blogs-emacs-active")
               "* WAITTING Theme:%^{} :@Emacs:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bc" "blogs-makefile            有关makefile的博客" entry (file+headline blogs-makefile-active "blogs-makefile-active")
               "* WAITTING Theme:%^{} :@Makefile:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bd" "blogs-git				    有关git的博客" entry (file+headline blogs-git-active "blogs-git-active")
               "* WAITTING Theme:%^{} :@Git:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("be" "blogs-stm32f4     		有关stm32f4的博客" entry (file+headline blogs-stm32f4-active "blogs-stm32f4-active")
               "* WAITTING Theme:%^{} :@Stm32f4:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bf" "blogs-stm32f7     		有关stm32f7的博客" entry (file+headline blogs-stm32f7-active "blogs-stm32f7-active")
               "* WAITTING Theme:%^{} :@Stm32f7:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bg" "blogs-s3c2440     		有关s3c2440的博客" entry (file+headline blogs-s3c2440-active "blogs-s3c2440-active")
               "* WAITTING Theme:%^{} :@S3c2440:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bh" "blogs-raspberry-pi		有关树莓派的博客" entry (file+headline blogs-raspberry-pi-active "blogs-raspberry-pi-active")
               "* WAITTING Theme:%^{} :@RaPi:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bi" "blogs-C    				有关C的博客" entry (file+headline blogs-c-active "blogs-c-active")
               "* WAITTING Theme:%^{} :@C:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bj" "blogs-Cpp    				有关C++的博客" entry (file+headline blogs-cpp-active "blogs-cpp-active")
               "* WAITTING Theme:%^{} :@Cpp:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bk" "blogs-mysql    			有关mysql的博客" entry (file+headline blogs-mysql-active "blogs-mysql-active")
               "* WAITTING Theme:%^{} :@Mysql:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bl" "blogs-qt    				有关QT的博客" entry (file+headline blogs-qt-active "blogs-qt-active")
               "* WAITTING Theme:%^{} :@Qt:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bm" "blogs-tcp-ip    			有关TCP-IP的博客" entry (file+headline blogs-tcp-ip-active "blogs-tcp-ip-active")
               "* WAITTING Theme:%^{} :@TCP:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bn" "blogs-python     		    有关python的博客" entry (file+headline blogs-python-active "blogs-python-active")
               "* WAITTING Theme:%^{} :@Python:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bo" "blogs-linux-kernel     	有关linux-kernel的博客" entry (file+headline blogs-linux-kernel "blogs-linux-kernel")
               "* WAITTING Theme:%^{} :@Kernel:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("bp" "blogs-cmake     		    有关cmake的博客" entry (file+headline blogs-cmake-active "blogs-cmake-active")
               "* WAITTING Theme:%^{} :@Cmake:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ("br" "blogs-cmake-to-stm32     		    有关cmake开发stm32的博客" entry (file+headline blogs-cmake-to-stm32-active "blogs-cmake-to-stm32-active")
               "* WAITTING Theme:%^{} :@CmakeStm32:\n %?\n\nBlog creation time:%U %i\n"
               :empty-lines 0)
              ))

      ;; 定制查询
      (setq org-agenda-custom-commands
            '(("p" . "---------------Priority-------------------")
              ("pa" "------TODO--A------------" tags-todo "+PRIORITY=\"A\"") 
              ("pb" "------TODO--B------------" tags-todo "+PRIORITY=\"B\"") 
              ("pc" "------TODO--C------------" tags-todo "+PRIORITY=\"C\"") 

              ("v" . "---------------State----------------------")
              ("vt" "-------TODO--------------" tags "+TODO=\"TODO\"")
              ("vd" "-------DONE--------------" tags "+TODO=\"DONE\"")
              ("va" "-------ABORT-------------" tags "+TODO=\"ABORT\"")
              ("vw" "-------WAITING-----------" tags "+TODO=\"WAITTING\"")

              ("g" . "---------------Tag------------------------")
              ("gw" "-------@Work-------------" tags "+@Work")
              ("gl" "-------@Life-------------" tags "+@Life")
              ("gb" "-------@Blog-------------" tags "+@Blog")

              ("x" . "---------------Tags-----------------------")
              ("xa" "-------@Linux------------" tags "+@Linux")
              ("xb" "-------@Emacs------------" tags "+@Emacs")
              ("xc" "-------@Git--------------" tags "+@Git")
              ("xd" "-------@Makefile---------" tags "+@Makefile")
              ("xe" "-------@Stm32f4----------" tags "+@Stm32f4")
              ("xf" "-------@Stm32f7----------" tags "+@Stm32f7")
              ("xg" "-------@S3c2440----------" tags "+@S3c2440")
              ("xh" "-------@RaPi-------------" tags "+@RaPi")
              ("xi" "-------@C----------------" tags "+@C")
              ("xj" "-------@Cpp--------------" tags "+@Cpp")
              ("xk" "-------@Qt---------------" tags "+@Qt")
              ("xl" "-------@Mysql------------" tags "+@Mysql")
              ("xm" "-------@TCP--------------" tags "+@TCP")
              ("xn" "-------@Python-----------" tags "+@Python")
              ("xo" "-------@Kernel-----------" tags "+@Kernel")
              ("xp" "-------@Cmake------------" tags "+@Cmake")
              ("xr" "-------@Cmake-to-Stm32---" tags "+@CmakeStm32")
              ))

      ;; 归档
      (setq-default org-refile-targets
                    (quote
                     (("inbox.org" :level . 1)
                      ("work.org" :level . 1)
                      ("life.org" :level . 1)
                      ("blogs.org" :level . 1)
                      ("blogs-linux-active.org" :level . 1)
                      ("blogs-linux-arch-part1.org" :level . 1)
                      ("blogs-linux-arch-part2.org" :level . 1)
                      ("blogs-emacs-active.org" :level . 1)
                      ("blogs-emacs-arch-part1.org" :level . 1)
                      ("blogs-makefile-active.org" :level . 1)
                      ("blogs-makefile-arch-part1.org" :level . 1)
                      ("blogs-git-active.org" :level . 1)
                      ("blogs-git-arch-part1.org" :level . 1)
                      ("blogs-stm32f4-active.org" :level . 1)
                      ("blogs-stm32f4-arch-part1.org" :level . 1)
                      ("blogs-stm32f7-active.org" :level . 1)
                      ("blogs-stm32f7-arch-part1.org" :level . 1)
                      ("blogs-s3c2440-active.org" :level . 1)
                      ("blogs-s3c2440-arch-part1.org" :level . 1)
                      ("blogs-raspberry-pi-active.org" :level . 1)
                      ("blogs-raspberry-pi-arch-part1.org" :level . 1)
                      ("blogs-C.org-active" :level . 1)
                      ("blogs-C-arch-part1.org" :level . 1)
                      ("blogs-Cpp-active.org" :level . 1)
                      ("blogs-Cpp-arch-part1.org" :level . 1)
                      ("blogs-mysql-active.org" :level . 1)
                      ("blogs-mysql-arch-part1.org" :level . 1)
                      ("blogs-qt-active.org" :level . 1)
                      ("blogs-qt-arch-part1.org" :level . 1)
                      ("blogs-tcp-ip-active.org" :level . 1)
                      ("blogs-tcp-ip-arch-part1.org" :level . 1)
                      ("blogs-python-active.org" :level . 1)
                      ("blogs-python-arch-part1.org" :level . 1)
                      ("blogs-linux-kernel.org" :level . 1)
                      ("blogs-cmake-active.org" :level . 1)
                      ("blogs-cmake-to-stm32-active.org" :level . 1)
                      )))
      )))
