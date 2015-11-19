;; =====================desktop-and-session========================
(use-package session
  :config
  (add-hook 'after-init-hook 'session-initialize))
(use-package desktop
  :config
  (add-to-list 'desktop-modes-not-to-save 'Info-mode)
  (add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
  (add-to-list 'desktop-modes-not-to-save 'fundamental-mode)
  (setq desktop-path '("~/.emacs.d/"))
  (setq desktop-dirname "~/.emacs.d/")
  (setq desktop-base-file-name "emacs-desktop")
  (desktop-save-mode t)
  ;; Minor modes not to be saved.
  (add-to-list 'desktop-minor-mode-table '(abbrev-mode nil))
  (add-to-list 'desktop-minor-mode-table '(auto-complete-mode nil))
  (add-to-list 'desktop-minor-mode-table '(drag-stuff-mode nil))
  (add-to-list 'desktop-minor-mode-table '(anzu-mode nil))
  (add-to-list 'desktop-minor-mode-table '(projectile-mode nil))
  (add-to-list 'desktop-minor-mode-table '(which-key-mode nil))
  (add-to-list 'desktop-minor-mode-table '(yas-minor-mode nil))
  (add-to-list 'desktop-minor-mode-table '(company-mode nil))
  (add-to-list 'desktop-minor-mode-table '(global-auto-revert-mode nil))
  (add-to-list 'desktop-minor-mode-table '(flx-ido-mode nil))
  (add-to-list 'desktop-minor-mode-table '(helm-mode nil))
  (add-to-list 'desktop-minor-mode-table '(aggressive-indent-mode nil))
  (add-to-list 'desktop-minor-mode-table '(elisp-slime-nav-mode nil))
  (add-to-list 'desktop-minor-mode-table '(rainbow-delimiters-mode nil))
  (add-to-list 'desktop-minor-mode-table '(paredit-mode nil))
  (add-to-list 'desktop-minor-mode-table '(undo-tree-mode nil))
  (add-to-list 'desktop-minor-mode-table '(TeX-PDF-mode nil))
  (add-to-list 'desktop-minor-mode-table '(org-cdlatex-mode nil))
  (add-to-list 'desktop-minor-mode-table '(iimage-mode nil))
  (add-to-list 'desktop-minor-mode-table '(wrap-region-mode nil))
  (add-to-list 'desktop-minor-mode-table '(paredit-everywhere-mode nil))
  (add-to-list 'desktop-minor-mode-table '(flycheck-mode nil))
  (add-to-list 'desktop-minor-mode-table '(flyspell-mode nil))
  (add-to-list 'desktop-minor-mode-table '(zotelo-minor-mode nil))
  (add-to-list 'desktop-minor-mode-table '(auto-fill-mode nil))
  (add-to-list 'desktop-minor-mode-table '(override-global-mode nil))
  (add-to-list 'desktop-minor-mode-table '(outline-minor-mode nil))
  (add-to-list 'desktop-minor-mode-table '(orgtbl-mode nil))
  (add-to-list 'desktop-minor-mode-table '(reftex-mode nil))
  (add-to-list 'desktop-minor-mode-table '(magic-latex-buffer nil))
  (add-to-list 'desktop-minor-mode-table '(hs-minor-mode nil))
  (add-to-list 'desktop-minor-mode-table '(helm-gtags-mode nil))
  (add-to-list 'desktop-minor-mode-table '(function-args-mode nil))
  (add-to-list 'desktop-minor-mode-table '(linum-mode nil)))
;; ==========打开文件时自动跳转到上次的位置(不好用)===========
;; ;; Save point position between sessions
;; (require 'saveplace)
;; (setq-default save-place t)
;; (setq save-place-file (expand-file-name ".places" user-emacs-directory))
;; ==========打开文件时自动跳转到上次的位置(不好用)===========
;; =====================desktop-and-session========================
(provide 'setup_desktop_session)
