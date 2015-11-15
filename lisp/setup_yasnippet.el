;; ==================yasnippet===================
(use-package yasnippet
  :defer t
  :config
  ;; (yas-initialize)
  (yas-global-mode 1)
  (yas-minor-mode 1)
  (define-key yas-minor-mode-map (kbd "M-I") 'yas-expand)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets" ;; personal snippets
          ;;         "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
          ;;         "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
          ;;         "/path/to/yasnippet/snippets"         ;; the default collection
          ))
  ;; 使用ac的popup代替yas/choose-value自带的弹出菜单
  (use-package popup
    :config
    (define-key popup-menu-keymap (kbd "C-p") 'popup-previous)
    (define-key popup-menu-keymap (kbd "C-n") 'popup-next)
    (define-key popup-menu-keymap (kbd "M-p") 'popup-previous)
    (define-key popup-menu-keymap (kbd "M-n") 'popup-next)
    (define-key popup-menu-keymap (kbd "TAB") 'popup-next)
    (defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
      (when (featurep 'popup)
        (popup-menu*
         (mapcar
          (lambda (choice)
            (popup-make-item
             (or (and display-fn (funcall display-fn choice))
                 choice)
             :value choice))
          choices)
         :prompt prompt
         ;; start isearch mode immediately
         :isearch t
         )))
    (setq yas-prompt-functions '(yas-popup-isearch-prompt yas-no-prompt))))
;; ==================yasnippet===================
(provide 'setup_yasnippet)
