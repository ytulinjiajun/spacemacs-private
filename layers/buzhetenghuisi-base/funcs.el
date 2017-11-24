
(define-abbrev-table 'global-abbrev-table '(
                                            ("8zs" ";;-----------------------------------------------------------------------
;; 
;;-----------------------------------------------------------------------")
                                            ("8zscm" "#-------------------------------------------------------------------------------------------------
# 
#-------------------------------------------------------------------------------------------------")
                                            ("8zspy" "#!/usr/bin/python")
                                            ("8zsch" "#ifndef _XX_H
#define _XX_H
#endif")))

(defun my-blogs ()
  (interactive)
  (find-file "~/.my-agenda"))

(defun config-emacs ()
  (interactive)
  (find-file "~/.spacemacs.d/layers/buzhetenghuisi-base/"))

(defun stm32 ()
  (interactive)
  (find-file "~/workspace/project/stm32"))

;;-----------------------------------------------------------------------
;; 改善 org-mode中 org-insert-todo-heading的行为
;;-----------------------------------------------------------------------
(defun improve-org-insert-todo-heading ()
  (interactive)
  (progn
    (org-insert-todo-heading t)
    (delete-backward-char 4 nil)
    ))

(defun improve-org-insert-todo-subheading ()
  (interactive)
  (progn
    (org-insert-todo-subheading t)
    (delete-backward-char 4 nil)
    ))
