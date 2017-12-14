;;-----------------------------------------------------------------------
;; 定制前缀
;;----------------------------------------------------------------------- 
(spacemacs/declare-prefix "o" "oh-my-key")
(spacemacs/declare-prefix "op" "project")
(spacemacs/declare-prefix "oc" "configuration")
(spacemacs/declare-prefix "oo" "agenda")
;;-----------------------------------------------------------------------
;; 快捷键
;;----------------------------------------------------------------------- 
(spacemacs/set-leader-keys "ob" 'my-blogs)

(spacemacs/set-leader-keys "oce" 'config-emacs)

(spacemacs/set-leader-keys "ops" 'stm32)

(spacemacs/set-leader-keys "ooa" 'org-agenda)
(spacemacs/set-leader-keys "ooc" 'org-capture)

(global-unset-key "\254")
(global-set-key (kbd "M-,") 'improve-org-insert-todo-heading)

(global-unset-key "\256")
(global-set-key (kbd "M-.") 'improve-org-insert-todo-subheading)

;;-----------------------------------------------------------------------
;; 饥饿删除
;;----------------------------------------------------------------------- 
(global-hungry-delete-mode t)
;;-----------------------------------------------------------------------
;; 将C-r更改为向后删除
;;-----------------------------------------------------------------------
(global-unset-key "")
(global-set-key (kbd "C-r") 'hungry-delete-backward)
;;-----------------------------------------------------------------------
;; 拼写检查
;;-----------------------------------------------------------------------
(global-set-key (kbd "M-=") 'flyspell-correct-word-generic)
;;-----------------------------------------------------------------------
;; 注释
;;-----------------------------------------------------------------------
(global-unset-key "\273")
(global-set-key (kbd "M-;") 'comment-line)

(global-unset-key "\247")
(global-set-key (kbd "M-'") 'comment-dwim)

;;-----------------------------------------------------------------------
;; 增强型的 occur
;;-----------------------------------------------------------------------
(global-unset-key "\363o")
(global-set-key (kbd "M-s o") 'occur-dwim)
(global-set-key (kbd "M-s e") 'iedit-mode)
