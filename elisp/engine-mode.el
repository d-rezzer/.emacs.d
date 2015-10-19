;;engine mode this is pretty neato burrito
(require 'engine-mode)

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")


(engine-mode t)  
