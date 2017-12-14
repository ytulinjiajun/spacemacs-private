
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

;;----------------------------------------------------------------------
;; 增强occur-mode,使得在当前单词的位置按下M-s o时，可以自动抓取光标所在的
;; 单词，而不必手动输入
;;----------------------------------------------------------------------
(defun occur-dwim ()
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))
