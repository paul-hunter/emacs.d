
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (atomic-chrome company-anaconda company magit anaconda-mode web-mode tuareg treemacs doom-themes helm neotree)))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Arduino formatting
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))

;; scrollers
(global-set-key "\M-n" "\C-u2\C-v")
(global-set-key "\M-p" "\C-u2\M-v")

;;C formatting change
(setq c-default-style "linux" c-basic-offset 4)

;;disable toolbar, scrollbar, menubar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;turn on menus with f10
(global-set-key (kbd "<f10>") 'menu-bar-mode)

;;turning line numbers on
(add-hook 'prog-mode-hook 'linum-mode)
;;(add-hook 'prog-mode-hook 'column-number-mode)
;;(global-linum-mode t)

;;melpa addition
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;;magit
;;(global-set-key (kbd "C-x g") 'magit-status)
;;(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;;setting neotree shortcut
(global-set-key [f8] 'neotree-toggle)

;;anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)

;;editing in chrome
(require 'atomic-chrome)
(atomic-chrome-start-server)
(setq atomic-chrome-buffer-open-style 'frame)
(setq atomic-chrome-buffer-frame-width 80)
(setq atomic-chrome-buffer-frame-height 40)

;;helm settings
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(helm-mode 1)

(require 'all-the-icons)
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
;;(doom-themes-neotree-config)
;; or for treemacs users
;;(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

(add-to-list 'load-path "DIR")

;;web-mode installation
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-auto-quote-style 2)

;; Company mode settings
(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0.3)

;;anaconda mode backend
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))


(add-hook 'python-mode-hook 'anaconda-mode)

;;format whole buffer
(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key [f12] 'indent-buffer)

