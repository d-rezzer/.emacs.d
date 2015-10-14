;;this is my super awesome noob init file
;;(setq inhibit-startup-screen t)
;;package.el
(require 'package)


(add-to-list 'load-path "~/.emacs.d/elisp/")

(load-library "themes")
;;(load-library "mail")

;;I would like to know how i could detect OS
;;============================================================

(defun figwheel-repl ()
  (interactive)
  (run-clojure "lein figwheel"))

(add-hook 'clojure-mode-hook #'inf-clojure-mode)




(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;;emmet
(defvar my-packages '(helm cider ace-window paredit emmet-mode))



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

(shell)




  










