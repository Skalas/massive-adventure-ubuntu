;; ruby mode enh
;; (add-to-list 'load-path "/home/skalas/.emacs.d/elpa/enh-ruby-mode-20140520.1524/") ; must be added after any path containing old ruby-mode
;; (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
;; (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
;; (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(projectile-global-mode)
(add-hook 'ruby-mode-hook 'projectile-on)
(setq enh-ruby-program "/home/skalas/.rbenv/versions/2.0.0-p451/bin/ruby")
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cap$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode)) 
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
 
(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)
 
(require 'cl) ; If you don't have it already
 
(defun* get-closest-gemfile-root (&optional (file "Gemfile"))
"Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
(let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
(loop
for d = default-directory then (expand-file-name ".." d)
if (file-exists-p (expand-file-name file d))
return d
if (equal d root)
return nil)))
 
(require 'compile)
 
(defun rspec-compile-file ()
(interactive)
(compile (format "cd %s;bundle exec rspec %s"
(get-closest-gemfile-root)
(file-relative-name (buffer-file-name) (get-closest-gemfile-root))
) t))
 
(defun rspec-compile-on-line ()
(interactive)
(compile (format "cd %s;bundle exec rspec %s -l %s"
(get-closest-gemfile-root)
(file-relative-name (buffer-file-name) (get-closest-gemfile-root))
(line-number-at-pos)
) t))
 
(add-hook 'enh-ruby-mode-hook
(lambda ()
(local-set-key (kbd "C-c l") 'rspec-compile-on-line)
(local-set-key (kbd "C-c k") 'rspec-compile-file)
))
;; Rhtml
(defun rhtml-mode-hook ()
(autoload 'rhtml-mode "rhtml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
(add-hook 'rhtml-mode '(lambda ()
			 (define-key rhtml-mode-map (kbd "M-s") 'save-buffer))))
