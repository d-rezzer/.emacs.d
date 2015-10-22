;;this is my super awesome noob init file
;;(setq inhibit-startup-screen t)
;;package.el
(require 'package)

(add-to-list 'load-path "~/.emacs.d/elisp/")

;;I would like to know how i could detect OS
;;============================================================

(defun figwheel-repl ()
  (interactive)
  (run-clojure "lein figwheel"))

(add-hook 'clojure-mode-hook #'inf-clojure-mode)


(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;;emmet
(defvar my-packages '(helm cider inf-clojure magit projectile helm-projectile ace-window smartparens emmet-mode))



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


(require 'smartparens-config)
(load-library "my-keybindings")
(load-library "themes")
(load-library "engine-mode")
;;(load-library "mail")
(smartparens-global-mode 1)



(eval-after-load "helm"
  (progn
    (message "helm mode loaded")
    (helm-mode 1)
    ))


;;(setq company-idle-delay t)
;;(global-set-key (kbd "M-TAB") #'company-complete) ;;meta-Tab
	  

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





   (require 'emmet-mode) ;;do I need require? not sure..
   (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
   (add-hook 'html-mode-hook 'emmet-mode)
   (add-hook 'css-mode-hook  'emmet-mode)

;;(shell)

;;(require 'projectile)
;;(require 'helm-projectile)
(projectile-global-mode)

(setq projectile-indexing-method 'native)
(setq projectile-enable-caching nil )
(setq projectile-require-project-root t)

;;Integrated find file with projectile.
;; from some clever dude on the interwebs
 (defun dz-open-file ()			
   "open file using helm-projectile or ido"
   (interactive)
   (if (projectile-project-p)
       (helm-projectile)
     (helm-for-files)))
 
