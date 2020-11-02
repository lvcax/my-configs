;;; package - Summary
;; Remove welcome message
(setq inhibit-startup-message t)

;; Remove menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Remove scrollbar
(scroll-bar-mode -1)

;; Enumerate rows
(global-linum-mode t)

;; Fontsize
(set-face-attribute 'default nil :height 108)

;; Packages
(require 'package)
(setq package-enable-at-startup nil)

;; MELPA - Repository
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;----------Functions----------;;
(defun new-empty-buffer ()
  (interactive)
  (let ((-buf (generate-new-buffer "untitled")))
    (switch-to-buffer -buf)
    (funcall inital-major-mode)
    (setq buffer-offer-save t)))

;;----------My Packages----------;;
(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-setup-side-window-right-bottom)
    (which-key-mode)))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
  :bind (("C-\\" . 'neotree-toggle)))

(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))

(use-package markdown-mode
  :ensure t)

(use-package magit
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package julia-mode
  :ensure t
  :defer t
  :init
  (setq inferior-julia-program-name "/usr/bin/julia"))

(use-package lsp-mode
  :ensure t
  :commands lsp
  :diminish lsp-mode
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "/usr/bin/elixir"))

;; Init screen
(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((recents . 5)
			    (projects . 5)))
    (setq dashboard-banner-logo-title "Oi, lindeza!")
    (setq dashboard-startup-banner 'logo)
    (setq dashboard-set-file-icons t)
    (setq dashboard-heading-icons t)
    (setq dashboard-set-init-info nil)
    )
  :config
  (dashboard-setup-startup-hook))

;; Theme
(use-package rebecca-theme
  :ensure t
  :config (load-theme 'rebecca t))

;;----------My shortcuts----------;;
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<up>") 'enlarge-window)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-l") 'select-line)
(global-set-key (kbd "C-z") 'undo)
(global-set-key "\C-n" 'new-empty-buffer)
(global-set-key "\C-a" 'mark-whole-buffer)
(global-set-key "\C-k" (lambda () (interactive) (kill-buffer (current-buffer))))
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-mode julia-mode dashboard projectile magit markdown-mode flycheck rebecca-theme night-owl-theme ace-window neotree all-the-icons auto-complete which-key try use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
