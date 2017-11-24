;;; config.el --- buzhetenghuisi-base configuration File for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
;;-----------------------------------------------------------------------
;; 缩写模板
;;-----------------------------------------------------------------------
(setq default-abbrev-mode t)            ;开启缩写模式

;;-----------------------------------------------------------------------
;; 优化 C-a,C-e 的行为
;;----------------------------------------------------------------------- 
(defvar better-defaults-move-to-beginning-of-code-first t
  "when t, first stroke of C-a will move the cursor to the beginning of code.
When nil, first stroke will go to the beginning of line.
Subsequent strokes will toggle between beginning of line and beginning of code.")
(defvar better-defaults-move-to-end-of-code-first t
  "when t, first stroke of C-e will move the cursor to the end of code (before comments).
When nil, first stroke will go to the end of line (after comments).
Subsequent strokes will toggle between end of line and end of code.")

;;-----------------------------------------------------------------------
;;高亮BEGIN_SRC里面的代码,插入这个宏的快捷键是：<s回车
;;----------------------------------------------------------------------- 
(setq org-src-fontify-natively t)
;;-----------------------------------------------------------------------
;; 强制垂直分屏 
;;----------------------------------------------------------------------- 
(setq split-width-threshold 120)
;;-----------------------------------------------------------------------
;; 配置ispell 
;;----------------------------------------------------------------------- 
