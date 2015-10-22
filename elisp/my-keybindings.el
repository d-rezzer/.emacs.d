;;magit
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup) 
;;helm
(global-set-key (kbd "C-c C-f") 'helm-projectile)
(global-set-key (kbd "C-, f") 'dz-open-file)

;;ace-window
(global-set-key (kbd "M-p") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; I like to put my special sauce under C-,
(global-set-key (kbd "C-, e") 'eshell)
(global-set-key (kbd "C-, z") 'shell)
(global-set-key (kbd "C-, p") 'list-packages)

(global-set-key (kbd "C-<left>") 'buf-move-left)
(global-set-key (kbd "C-<right>") 'buf-move-right)
(global-set-key (kbd "C-<up>") 'buf-move-up)
(global-set-key (kbd "C-<down>") 'buf-move-down)


;;(global-set-key (kbd "") 'some-cmd)
