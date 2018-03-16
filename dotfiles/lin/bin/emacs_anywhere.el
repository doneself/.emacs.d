(defun ea-on-delete (frame)
  (write-region nil nil "/tmp/eaclipboard")
  (shell-command "xclip -selection clipboard /tmp/eaclipboard &> /dev/null")
  (kill-buffer "*Emacs Anywhere*"))
(add-hook 'delete-frame-functions 'ea-on-delete)
(switch-to-buffer "*Emacs Anywhere*")
(select-frame-set-input-focus (selected-frame))