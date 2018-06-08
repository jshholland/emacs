(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/")
			 '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)

(load-theme 'snazzy t)

(set-face-font 'default "Fira Mono-12")
(set-face-font 'fixed-pitch-serif "Fira Mono-12")
(set-face-font 'variable-pitch "Concourse T4-14")

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq desktop-restore-eager 3)
(desktop-save-mode 1)

(server-start)
(global-display-line-numbers-mode 1)

(global-flycheck-mode 1)
(global-company-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(put 'suspend-frame 'disabled t)

(require 'dired-x)
(setq dired-listing-switches "-alh")

(setq vc-handled-backends '(SVN))

(setq frame-title-format '("%b - Emacs " emacs-version))
(size-indication-mode 1)
(display-time)

(setq tramp-default-method "ssh")

(setq browse-url-browser-function 'browse-url-firefox)

(set-language-environment "UTF-8")

(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil)

(column-number-mode 1)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(setq next-line-add-newlines t)
(put 'scroll-left 'disabled nil)

(setq-default tab-width 4)

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'visual-line-mode)

(add-to-list 'load-path "~/h/structured-haskell-mode/elisp")
(require 'haskell-mode)
(require 'haskell-interactive-mode)
(require 'shm)
(require 'shm-case-split)
(setq shm-program-name "~/.local/bin/structured-haskell-mode")
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(set-face-background 'shm-current-face "#282828")
(set-face-background 'shm-quarantine-face "#ab4642")
(define-key shm-map (kbd "C-c C-s") 'shm/case-split)
(intero-global-mode 1)

(add-hook 'lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'scheme-mode-hook 'paredit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("9f3a4edb56d094366afed2a9ba3311bbced0f32ca44a47a765d8ef4ce5b8e4ea" "4cdea318a3efab7ff7c832daea05f6b2d5d0a18b9bfa79763b674e860ecbc6da" "83279c1d867646c5eea8a804a67a23e581b9b3b67f007e7831279ed3a4de9466" "0240d45644b370b0518e8407f5990a243c769fb0150a7e74297e6f7052a04a72" "75c0b1d2528f1bce72f53344939da57e290aa34bea79f3a1ee19d6808cb55149" default)))
 '(magit-use-overlays nil)
 '(org-agenda-files (quote ("~/Nextcloud/org/gtd.org")))
 '(package-selected-packages
   (quote
	(snazzy-theme auto-package-update use-package notmuch smtpmail-multi company-auctex rust-mode exec-path-from-shell smartparens csv-mode pkgbuild-mode tuareg yaml-mode xml-rpc virtualenvwrapper twittering-mode toml-mode solarized-theme slime shakespeare-mode sensitive rustfmt puppet-mode paredit org-trello markdown-mode magit love-minor-mode ledger-mode jekyll-modes jabber intero idris-mode hackernews go-mode ghc flycheck-rust feature-mode erc-hl-nicks edit-server cargo beeminder base16-theme auctex)))
 '(safe-local-variable-values (quote ((pyvenv-workon . miniserver_backup)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)

(setq magit-last-seen-setup-instructions "1.4.0")

(require 'ledger-mode)
(add-to-list 'auto-mode-alist '("\.ledger$" . ledger-mode))
(setq ledger-reconcile-default-commodity "£"
	  ledger-clear-whole-transactions t)

(setq org-directory "~/Nextcloud/org/"
	  org-default-notes-file (concat org-directory "default.org")
	  org-log-done 'time
	  org-capture-templates '(("t" "Todo" entry (file+headline (concat org-directory "gtd.org") "Tasks")
							   "** TODO %? %^G\n   %i\n   %a\n   Added: %U")
							  ("w" "Work log" item (file+olp+datetree "" "Work log")))
	  org-tag-alist '((:startgroup . nil)
					  ("office" . ?o) ("home" . ?h) ("worcester" . ?w)
					  ("town" . ?t) ("supermarket" . ?s) ("phone" . ?p)
					  (:endgroup . nil))
	  org-fast-tag-selection-single-key t
	  org-todo-keywords '((sequence "TODO" "|" "DONE"))
	  org-refile-targets `((,(concat org-directory "gtd.org") :maxlevel . 1)
						   (,(concat org-directory "someday.org") :level . 2))
	  org-agenda-custom-commands '(("cb" tags-todo "+supermarket")
								   ("ct" tags-todo "+town")))
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq TeX-auto-save t
	  TeX-parse-self t)
(setq-default TeX-master nil)

(setq user-full-name "Josh Holland"
	  user-mail-address "josh@inv.alid.pw"
	  notmuch-command "~/.local/bin/notmuch-remote"
	  send-mail-function 'smtpmail-multi-send-it
	  message-send-mail-function 'smtpmail-multi-send-it
	  smtpmail-multi-accounts '((soton . ("jh2e16"
										  "smtp.soton.ac.uk"
										  25
										  nil
										  starttls
										  nil
										  nil
										  "soton.ac.uk"))
								(fastmail . ("jshholland@fastmail.fm"
											 "smtp.fastmail.com"
											 465
											 nil
											 ssl
											 nil
											 nil
											 "inv.alid.pw")))
	  smtpmail-multi-account-default-account 'fastmail
	  smtpmail-multi-associations '(("josh@inv.alid.pw\\|josh@jholland.eu" fastmail)
									("j.holland@soton.ac.uk\\|jh2e16@soton.ac.uk" soton)))

(auto-package-update-maybe)
