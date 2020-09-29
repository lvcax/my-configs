;; Remover boas vindas
(setq inhibit-startup-message t)

;; Remover menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Remover barra de rolager
(scroll-bar-mode -1)

;; Adicionar numero nas linhas
(global-linum-mode t)

;; Tamanho da fonte
(set-face-attribute 'default nil :height 110)


;; pacotes
(require 'package)
(setq package-enable-at-startup nil) ; desabilitar inicio de ativação

;; MELPA - repositório
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize) ; iniciar pacotes

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (progn
    (which-key-setup-side-window-right-bottom)
    (which-key-mode)
  )
  )

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :bind (("C-\\" . 'neotree-toggle)))

(use-package ace-window
  :ensure t)

;; Tema
(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula))

;; Nossos atalhos
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<up>") 'enlarge-window)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "M-c") 'ace-window)


;;(use-package ergoemacs-mode
;;  :ensure t
;;  :config
;;  (progn
;;    (setq ergoemacs-theme nil)
;;    (setq ergoemacs-keyboard-layout "us")
;;    (ergoemacs-mode 1)))



;; MELPA SETTINGS
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("24714e2cb4a9d6ec1335de295966906474fdb668429549416ed8636196cb1441" "e208e45345b91e391fa66ce028e2b30a6aa82a37da8aa988c3f3c011a15baa22" default))
 '(package-selected-packages
   '(afternoon-theme ace-window neotree which-key try use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled  nil)
