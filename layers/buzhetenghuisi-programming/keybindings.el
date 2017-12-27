;;-----------------------------------------------------------------------
;; rtags 跳转
;;-----------------------------------------------------------------------
(spacemacs/set-leader-keys "gg" 'rtags-find-symbol-at-point)
(spacemacs/set-leader-keys "gr" 'rtags-find-all-references-at-point)
(spacemacs/set-leader-keys "gb" 'rtags-location-stack-back)
(spacemacs/set-leader-keys "gf" 'rtags-location-stack-forward)

(spacemacs/set-leader-keys "gi" 'rtags-include-file)

(spacemacs/declare-prefix "gp" "rtags-printf-something")
(spacemacs/set-leader-keys "gpi" 'rtags-print-symbol-info)
(spacemacs/set-leader-keys "gps" 'rtags-print-source-arguments)
(spacemacs/set-leader-keys "gpd" 'rtags-print-dependencies)
(spacemacs/set-leader-keys "gpt" 'rtags-symbol-type)
