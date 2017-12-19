(defun ycmd-setup-completion-at-point-function ()
  (interactive)
  "Setup `completion-at-point-functions' for `ycmd-mode'."
  (add-hook 'completion-at-point-functions
            #'ycmd-complete-at-point nil :local))
