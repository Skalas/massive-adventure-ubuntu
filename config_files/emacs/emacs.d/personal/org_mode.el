(setq org-src-fontify-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   (sql . t)
   (latex . t)
   ))
(require 'ox-latex)

(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)   
(add-hook 'org-mode-hook 'org-display-inline-images)  
(setq org-latex-to-pdf-process (list "latexmk -pdf %f"))
(add-hook 'org-mode-hook
(lambda()
(flyspell-mode 1)))

(global-set-key (kbd "C-c M")
(lambda()(interactive)
(ispell-change-dictionary "mexico")
(flyspell-buffer)))
