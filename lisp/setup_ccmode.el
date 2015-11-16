;; =======================ccmode========================
;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq c-default-style "linux") ;; set style to "linux"
(defun c-compile-current-file ()
  (interactive)
  (unless (file-exists-p "Makefile")
    (let ((file (file-name-nondirectory buffer-file-name)))
      (compile (format "%s -o %s.out %s %s %s"
                       (or (getenv "CC") "gcc")
                       (file-name-sans-extension file)
                       (or (getenv "CPPFLAGS") "")
                       (or (getenv "CFLAGS") "-Wall -g")
                       file)))))
(add-hook 'c-mode-hook
          (lambda ()
            (define-key c-mode-base-map (kbd "C-c C-c") 'c-compile-current-file)
            (define-key c-mode-base-map (kbd "(") nil)
            (define-key c-mode-base-map (kbd "{") nil)))
;; =======================gdb=======================
(use-package gdb-mi
  :defer t
  :bind (("C-M-S-g" . gdb)
         ("C-M-g" . gdb-or-gud-go)
         ("C-S-g" . gud-kill))
  :config
  ;; 默认打开多窗口会有问题
  (setq gdb-many-windows t)
  ;; 出现问题，在于 gdb-ui过时了，似乎改成gdb-mi。
  (defun gdb-or-gud-go ()
    "If gdb isn't running; run gdb, else call gud-go."
    (interactive)
    (if (and gud-comint-buffer
             (buffer-name gud-comint-buffer)
             (get-buffer-process gud-comint-buffer)
             ;; (with-current-buffer gud-comint-buffer (eq gud-minor-mode 'gdb))
             )
        (gud-call (if gdb-active-process "continue" "run") "")
      (gdb (gud-query-cmdline 'gdb))))
  (defun gud-kill ()
    "Kill gdb process."
    (interactive)
    ;; 关闭其他四个buffer，其中io buffer会询问
    (kill-buffer (gdb-locals-buffer-name))
    (kill-buffer (gdb-stack-buffer-name))
    (kill-buffer (gdb-breakpoints-buffer-name))
    (kill-buffer (gdb-inferior-io-name))
    ;; 关闭gdb buffer
    (with-current-buffer gud-comint-buffer (comint-skip-input))
    (kill-process (get-buffer-process gud-comint-buffer))
    (delete-window))
  ;; 关闭gdb的process时，关闭buffer。取自setup_misc中'退出shell时关闭buffer'。
  (add-hook 'gdb-mode-hook 'kill-shell-buffer-after-exit t)
  ;; 直接使用gdb-or-gud-go会显示gud-comint-buffer变量未定义，需要先使用gdb一次，然后才能使用gdb-or-gud-go。
  ;; 所以先使用C-M-S-g一次，再使用C-M-g。
  )
;; =======================gdb=======================
;; =======================function-args===========================
(use-package function-args
  :defer t
  :init
  (add-hook 'c-mode-hook 'fa-config-default)
  :config
  (define-key function-args-mode-map (kbd "M-s M-u") 'moo-complete)
  (define-key function-args-mode-map (kbd "M-s M-U") 'fa-show)
  (define-key function-args-mode-map (kbd "C-j") 'fa-jump-maybe)
  (define-key function-args-mode-map (kbd "M-s C-i") 'moo-jump-local)
  (define-key function-args-mode-map (kbd "M-n") nil)
  (define-key function-args-mode-map (kbd "M-u") nil))
;; =======================function-args===========================
;; =======================hs-minor-mode===========================
(use-package hideshow
  :defer t
  :init
  (add-hook 'c-mode-common-hook 'hs-minor-mode)
  :config
  (add-hook 'c-mode-hook
            (lambda ()
              (define-key hs-minor-mode-map (kbd "C-M-i") 'hs-toggle-hiding))))
;; =======================hs-minor-mode===========================
;; =======================semantic===========================
(use-package semantic
  :config
  (global-semanticdb-minor-mode 1)
  ;; 在空闲时分析buffer。
  (global-semantic-idle-scheduler-mode 1)
  ;; 在minibuffer显示函数。
  (global-semantic-idle-summary-mode 1)
  ;; 在header-line显示函数，显示有问题。可以用which-function-mode代替。
  (global-semantic-stickyfunc-mode 0)
  (semantic-mode 1)
  (define-key semantic-mode-map (kbd "C-c ,") nil)
  ;; 所有semantic的快捷键均以C-c ,为前缀，可以考虑用M-s s代替。
  )
;; =======================semantic===========================
;; =======================helm-gtags===========================
;; helm-man-woman: C-x c m
;; helm-semantic-or-imenu: C-x c i
;; 可以使用senator-previous-tag和senator-next-tag跳转tag。
(use-package helm-gtags
  :defer t
  :init
  (setq
   helm-gtags-ignore-case t
   helm-gtags-auto-update t
   helm-gtags-use-input-at-cursor t
   helm-gtags-pulse-at-cursor t
   helm-gtags-prefix-key "\M-sg"
   helm-gtags-suggested-key-mapping t)
  ;; Enable helm-gtags-mode
  ;; (add-hook 'dired-mode-hook 'helm-gtags-mode)
  ;; (add-hook 'eshell-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode)
  :config
  (define-key helm-gtags-mode-map (kbd "M-s g a") 'helm-gtags-tags-in-this-function)
  (define-key helm-gtags-mode-map (kbd "C-x C-,") 'helm-gtags-dwim)
  (define-key helm-gtags-mode-map (kbd "C-x C-.") 'helm-gtags-pop-stack)
  (define-key helm-gtags-mode-map (kbd "C-x C-/") 'helm-gtags-select)
  (define-key helm-gtags-mode-map (kbd "C-x <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-x >") 'helm-gtags-next-history))
;; =======================helm-gtags===========================
;; =======================company===========================
(use-package company
  :defer t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-show-numbers t)
  (global-set-key (kbd "M-U") 'company-complete-common)
  :config
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (dotimes (i 10)
    (define-key company-active-map (read-kbd-macro (format "C-%d" i)) 'company-complete-number))
  ;; company-quickhelp-mode
  (require 'company-quickhelp)
  (company-quickhelp-mode 1)
  (setq company-quickhelp-delay nil)
  (define-key company-active-map (kbd "C-o") #'company-quickhelp-manual-begin)
  ;; 在弹出popup的情况下，C-h 打开*Help*，C-w 进入文件，C-o弹出pos-tip，C-s 搜索，C-M-s 过滤。
  ;; company-c-headers
  (add-to-list 'company-backends 'company-c-headers)
  (setq company-backends (delete 'company-semantic company-backends))
  ;; To complete for projects, you need to tell Clang your include paths.
  ;; Create a file named .dir-locals.el at your project root:
  ;; ((nil . ((company-clang-arguments . ("-I/home/<user>/project_root/include1/"
  ;;                                      "-I/home/<user>/project_root/include2/")))))
  ;; If you use Helm, you can easily insert absolute path by C-c i at the current path in helm-find-files.
  )
;; =======================company===========================
;; =======================ccmode========================
(provide 'setup_ccmode)
