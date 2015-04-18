;; ===========================全局快捷键==============================
(global-set-key (kbd "C-c `") 'ibuffer)
(global-set-key (kbd "C-c ~") 'speedbar-get-focus)
(global-set-key (kbd "M-,") 'delete-other-windows)
(global-set-key (kbd "M-s M-,") 'split-window-vertically)
(global-set-key (kbd "M-s M-.") 'split-window-horizontally)
(global-set-key (kbd "M-.") 'delete-window)
(global-set-key (kbd "C-M-1") 'eshell)
(global-set-key (kbd "C-M-!") 'shell)
(global-set-key (kbd "C-M-2") 'kid-sdcv-to-buffer)
(global-set-key (kbd "C-M-3") 'run-octave)
(global-set-key (kbd "C-M-#") 'calculator)
(global-set-key (kbd "C-M-5") 'w3m)
(global-set-key (kbd "C-M-6") 'calendar)
(global-set-key (kbd "C-;") 'set-mark-command)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key [f9] 'menu-bar-mode)
(global-set-key (kbd "C-SPC") nil)
;; (defun prev-window ()
;;   (interactive)
;;   (other-window -1))
;; (global-set-key (kbd "<C-S-iso-lefttab>") 'prev-window)
;; ===========================全局快捷键==============================
(provide 'setup_keybindings)
