;;this is my super awesome noob init file
;;(setq inhibit-startup-screen t)

;;trying to understand the theme system.

;;should do some checking bits
;;;(load-theme 'zenburn)
(set-default-font "Source Code Pro")

;;;;;;;Theme stuff ;;;;;;;;
(setq my-themes '(zenburn monochrome monokai atom-dark))

(setq my-cur-theme nil)

(defun cycle-my-theme ()
  "Cycle through the list of themes"
  (interactive)
  (when my-cur-theme
    (disable-theme my-cur-theme)
    (setq my-themes (append my-themes (list my-cur-theme))))
  (setq my-cur-theme (pop my-themes))
  (load-theme my-cur-theme t))


;;bind to 
(global-set-key (kbd "C-t") 'cycle-my-theme)

;;package.el
(require 'package)


(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;;emmet
(defvar my-packages '(helm cider ace-window paredit emmet-mode zenburn-theme monochrome-theme solarized-theme monokai-theme atom-dark-theme))



(defun install-sweet-package-love ()
  "Install only the sweetest of packages!"
  (interactive)
  (package-refresh-contents)
  (mapc #'(lambda (package)
	    (unless (package-installed-p package)
	      (package-install package)))
	my-packages))

(install-sweet-package-love)
;; does the same as above it seems, just differently. 
;;(dolist (p my-packages)
;;  (when (not (package-installed-p p))
;;    (package-install p)))


(eval-after-load "helm"
  (progn
    (message "helm mode loaded")
    (helm-mode 1)
    ))

;; for some reason paredit is not being
;; enabled ....
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of lisp code" t) 
(add-hook 'emacs-list-mode-hook  (enable-paredit-mode))
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook 'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(eval-after-load "paredit"
  (progn
    (message "paredit mode loaded")
    (enable-paredit-mode)))


;; to triggger company completions manually
;;(setq company-idle-delay t)
;(global-set-key (kbd "M-TAB") #'company-complete) ;;meta-Tab
	  
;;;; I'm not really diggin evil mode. 
;make evil mode do its thing on start up.
;(require 'evil)
;(eval-after-load "evil"
 ;(progn
  ;  (message "evil mode loaded") 
   ; (evil-mode 1)))

;;change mode line color by evil state

;; change mode-line color by evil state

;;clear the eshell buffer because there is no clear screen.
(defun eshell-clear-buffer ()
  "Clear terminal"
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(add-hook 'eshell-mode-hook
	  '(lambda()
	     (local-set-key (kbd "C-l") 'eshell-clear-buffer)))




;;ace-window
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))



   (require 'emmet-mode) ;;do I need require? not sure..
   (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
   (add-hook 'html-mode-hook 'emmet-mode)
   (add-hook 'css-mode-hook  'emmet-mode)



;;try to get babun to run in macs. would be boss.
;;this sorta works..
(defun babun-shell ()
  "run cygwin/babun inside emacs shell mode"
  (interactive)
  (let ((explicit-shell-file-name "C:/Users/ryan/.babun/cygwin/cygwin.bat"))
    (call-interactively 'shell) ) )

;;the cool babun cygwin shell..
(global-set-key [f1] 'babun-shell)


  



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8fed5e4b89cf69107d524c4b91b4a4c35bcf1b3563d5f306608f0c48f580fdf8" "19352d62ea0395879be564fc36bc0b4780d9768a964d26dfae8aad218062858d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

