;;-----------------------------------------------------------------------
;; 定制前缀
;;----------------------------------------------------------------------- 
(spacemacs/declare-prefix "o" "oh-my-key")
(spacemacs/declare-prefix "op" "project")
(spacemacs/declare-prefix "oc" "configuration")
;;-----------------------------------------------------------------------
;; 快捷键
;;----------------------------------------------------------------------- 
(spacemacs/set-leader-keys "ob" 'my-blogs)

(spacemacs/set-leader-keys "oce" 'config-emacs)

(spacemacs/set-leader-keys "ops" 'stm32)

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
