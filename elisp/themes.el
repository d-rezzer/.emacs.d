;;should do some checking bits

(defvar my-themes '( zenburn-theme monochrome-theme solarized-theme monokai-theme atom-dark-theme))

(defun install-sweet-package-love ()
  "Install only the sweetest of packages!"
  (interactive)
  (package-refresh-contents)
  (mapc #'(lambda (package)
	    (unless (package-installed-p package)
	      (package-install package)))
	my-themes))



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


