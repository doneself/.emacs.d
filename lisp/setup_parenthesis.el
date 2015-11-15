;; =============================括号==============================
;; (setq show-paren-style 'parenthesis)    ; highlight just brackets
;; (setq show-paren-style 'expression)     ; highlight entire bracket expression
;; (setq skeleton-pair t)                  ;自动插入匹配的括号
;; (global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;; (global-set-key (kbd "<") 'skeleton-pair-insert-maybe)
(defun insert-bracket-pair (leftBracket rightBracket)
  "Insert bracket pair automatically."
  (if (region-active-p)
      (let ((p1 (region-beginning))
            (p2 (region-end)))
        (goto-char p2)
        (insert rightBracket)
        (goto-char p1)
        (insert leftBracket)
        (goto-char (+ p2 2)))
    (progn
      (insert leftBracket rightBracket)
      (backward-char 1))))
(defun insert-bracket-pair-with-space (leftBracket rightBracket)
  "Insert bracket pair with space around automatically."
  (interactive)
  (if (or (char-equal (char-before) 32)
          (char-equal (char-before) 10))
      (insert leftBracket)
    (insert (concat " " leftBracket)))
  (if (or (char-equal (char-after) 32)
          (char-equal (char-after) 10))
      (progn (insert rightBracket)
             (backward-char 1))
    (progn (insert (concat rightBracket " "))
           (backward-char 2))))
(defun insert-pair-paren () (interactive) (insert-bracket-pair "(" ")"))
(defun insert-pair-bracket () (interactive) (insert-bracket-pair "[" "]"))
(defun insert-pair-brace () (interactive) (insert-bracket-pair "{" "}"))
(defun insert-pair-angle-bracket () (interactive) (insert-bracket-pair "<" ">"))
(defun insert-pair-double-angle-bracket () (interactive) (insert-bracket-pair "《" "》"))
(defun insert-pair-double-straight-quote () (interactive) (insert-bracket-pair "\"" "\""))
(defun insert-pair-single-straight-quote () (interactive) (insert-bracket-pair "'" "'"))
(defun insert-pair-double-curly-quote () (interactive) (insert-bracket-pair "“" "”"))
(defun insert-pair-single-curly-quote () (interactive) (insert-bracket-pair "‘" "’"))
(defun insert-pair-single-angle-quote‹› () (interactive) (insert-bracket-pair "‹" "›"))
(defun insert-pair-double-angle-quote«» () (interactive) (insert-bracket-pair "«" "»"))
(defun insert-pair-corner-bracket「」 () (interactive) (insert-bracket-pair "「" "」"))
(defun insert-pair-white-corner-bracket『』 () (interactive) (insert-bracket-pair "『" "』"))
(defun insert-pair-white-lenticular-bracket〖〗 () (interactive) (insert-bracket-pair "〖" "〗"))
(defun insert-pair-black-lenticular-bracket【】 () (interactive) (insert-bracket-pair "【" "】"))
(defun insert-pair-tortoise-shell-bracket〔〕 () (interactive) (insert-bracket-pair "〔" "〕"))
(defun insert-pair-math-bracket () (interactive) (insert-bracket-pair-with-space "$" "$"))
(global-set-key (kbd "(") 'insert-pair-paren)
(global-set-key (kbd "[") 'insert-pair-bracket)
(global-set-key (kbd "{") 'insert-pair-brace)
(global-set-key (kbd "<") 'insert-pair-angle-bracket)
(global-set-key (kbd "《") 'insert-pair-double-angle-bracket)
(global-set-key (kbd "\"") 'insert-pair-double-straight-quote)
(global-set-key (kbd "'") 'insert-pair-single-straight-quote)
(global-set-key (kbd "“") 'insert-pair-double-curly-quote)
(global-set-key (kbd "”") 'insert-pair-double-curly-quote)
(global-set-key (kbd "‘") 'insert-pair-single-curly-quote)
(global-set-key (kbd "’") 'insert-pair-single-curly-quote)
(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (define-key LaTeX-mode-map (kbd "$") 'insert-pair-math-bracket)))
(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map (kbd "$") 'insert-pair-math-bracket)))
;; ==================wrap-region==================
(use-package wrap-region
  :defer t
  :init
  (add-hook 'org-mode-hook 'wrap-region-mode)
  (add-hook 'latex-mode-hook 'wrap-region-mode)
  :config
  (add-hook 'wrap-region-before-wrap-hook 'wrap-region-add-space)
  (defun wrap-region-add-space ()
    "Add space around punctuations."
    (when (member left '("*" "~" "/" "=" "+" "_" "$"))
      (unless (or (char-equal (char-before (region-beginning)) 32)  ;空格
                  (char-equal (char-before (region-beginning)) 10)) ;回车
        (setq left (concat " " left)))
      (unless (or (char-equal (char-after (region-end)) 32)  ;空格
                  (char-equal (char-after (region-end)) 10)) ;回车
        (setq right (concat right " ")))))
  (wrap-region-add-wrappers
   '(("*" "*" nil org-mode)
     ("~" "~" nil org-mode)
     ("/" "/" nil org-mode)
     ("=" "=" nil org-mode)
     ("+" "+" nil org-mode)
     ("_" "_" nil org-mode)
     ("$" "$" nil (org-mode latex-mode)))))
;; ==================wrap-region==================
;; =======================rainbow-delimiters==========================
(use-package rainbow-delimiters
  :defer t
  :init
  ;; (global-rainbow-delimiters-mode)
  ;; 在org-mode中打开rainbow会让org本身的highlight失效
  ;; (add-hook 'org-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'dired-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'octave-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'gnuplot-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'c-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'graphviz-dot-mode-hook 'rainbow-delimiters-mode))
;; =======================rainbow-delimiters==========================
;; =============================括号==============================
(provide 'setup_parenthesis)
