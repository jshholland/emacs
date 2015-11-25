(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(load-theme 'base16-default-dark t)

(set-face-font 'default "Input Mono-13")
(set-face-font 'variable-pitch "Concourse T4-14")

(desktop-save-mode 1)
(setq desktop-save t)
(add-hook 'auto-save-hook
	  (lambda ()
	    (interactive)
	    (if (eq (desktop-owner) (emacs-pid))
		(desktop-save desktop-dirname))))

(server-start)
(global-linum-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(put 'suspend-frame 'disabled t)

(require 'dired-x)
(setq dired-listing-switches "-alh")

(setq vc-handled-backends nil)

(setq frame-title-format '("%b - Emacs " emacs-version))
(size-indication-mode 1)
(display-time)

(setq tramp-default-method "ssh")

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-unstable")

(set-language-environment "UTF-8")

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil)

(column-number-mode 1)

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(setq next-line-add-newlines t)
(put 'scroll-left 'disabled nil)

(setq-default tab-width 4)

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'visual-line-mode)

(add-to-list 'load-path "/home/jholland/h/structured-haskell-mode/elisp")
(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'shm)
(require 'shm-case-split)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(setq shm-program-name "/home/jholland/bin/structured-haskell-mode")
(set-face-background 'shm-current-face "#282828")
(set-face-background 'shm-quarantine-face "#ab4642")
(define-key shm-map (kbd "C-c C-s") 'shm/case-split)

(require 'edit-server)
(setq edit-server-new-frame t)
(add-hook 'edit-server-edit-mode-hook
	  (lambda ()
	    (visual-line-mode 1)
	    (auto-fill-mode -1)))
(edit-server-start)

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(add-hook 'slime-repl-mode-hook 'paredit-mode)
(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(require 'virtualenvwrapper)
(venv-initialize-eshell)
(setq venv-location "/home/jholland/.venvs/")
(add-hook 'python-mode (lambda () (setq indent-tabs-mode nil)))

(add-hook 'eshell-mode-hook
	  (lambda () (dolist (command '("tmux"))
		       (add-to-list 'eshell-visual-commands command))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("9f3a4edb56d094366afed2a9ba3311bbced0f32ca44a47a765d8ef4ce5b8e4ea" "4cdea318a3efab7ff7c832daea05f6b2d5d0a18b9bfa79763b674e860ecbc6da" "83279c1d867646c5eea8a804a67a23e581b9b3b67f007e7831279ed3a4de9466" "0240d45644b370b0518e8407f5990a243c769fb0150a7e74297e6f7052a04a72" "75c0b1d2528f1bce72f53344939da57e290aa34bea79f3a1ee19d6808cb55149" default)))
 '(magit-use-overlays nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)

(setq magit-last-seen-setup-instructions "1.4.0")

(setq lua-indent-level 2)
(add-hook 'lua-mode (lambda ()
					  (setq-local indent-tabs-mode nil)))
