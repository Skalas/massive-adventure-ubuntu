(package-initialize)       

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(inhibit-startup-screen t)
 '(menu-bat-mode -1)
 '(require (quote tool-bar))
 '(scroll-bar-mode nil)
 '(setq indent-tabs-mode)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 106 :width normal)))))
(require 'ido)
(ido-mode t)
(auto-complete-mode t)
(global-auto-complete-mode t)
;; aumentar y disminuír el tamaño, fácilmente
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)

(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq indent-tabs-mode nil)

(set-default 'indicate-empty-lines t)

(defalias 'qrr 'query-replace-regexp)
;; para comentar regiones en pocas lineas
(defalias 'comr 'comment-region)
(defalias 'ucomr 'uncomment-region)
;; Para acceder a los paquetes remotamente
(require 'package)
;; Para incluír acentos
(require 'iso-transl)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
;; tips 
(tooltip-mode -1)
(setq tooltip-use-echo-area t)
(global-linum-mode 1)
(add-to-list 'load-path "/home/skalas/.emacs.d/elpa/ess-20140507.2352/lisp")
(load "ess-site")
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))
;; matching parenthesis
(electric-pair-mode 1)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

(global-set-key "\C-x\C-b" 'ibuffer)

(global-set-key "\C-xg" 'magit-status)
;; Multiple cursors
(require 'multiple-cursors)
;; move between windows, only via keyboard
(global-set-key (kbd "<M-up>") 'window-jump-up)
(global-set-key (kbd "<M-right>") 'window-jump-right)
(global-set-key (kbd "<M-down>") 'window-jump-down)
(global-set-key (kbd "<M-left>") 'window-jump-left)

