;; Always ALWAYS use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Add .emacs.d to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;; Add every subdirectory of ~/.emacs.d/site-lisp to the load path
;(dolist
;    (project (directory-files (concat dotfiles-dir "site-lisp") t "\\w+"))
;  (when (file-directory-p project)
;    (add-to-list 'load-path project)))

(column-number-mode t)  ; show column numbers
(global-linum-mode t) ;Show line numbers on each line

(add-to-list 'load-path "~/.emacs.d")

;;Add ~/lib/lisp to load-path
(add-to-list 'load-path "~/lib/lisp/")

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

(global-set-key (kbd "C-z") 'undo) ; Ctrl+z
(global-set-key (kbd "C-S-z") 'redo) ;  Ctrl+Shift+z

(require 'auto-complete)
(global-auto-complete-mode t)

;Adding yasnippets
;(require 'yasnippet)
;(yas/initialize)
;(yas/load-directory "~/.emacs.d/snippets")

;; Adding SLIME
(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(add-to-list 'load-path "~/.emacs.d/slime/")  ; your SLIME directory
(require 'slime)
(slime-setup)

;(load-library "init_python")

(add-to-list 'load-path "~/.emacs.d/asciidoc")
(add-to-list 'load-path "~/.emacs.d/doc-mode-1.1")
(load-library "markdown-mode")
(load-library "doc-mode")
(load-library "asciidoc")

(setq ispell-dictionary "english")

;; Add community package host Maralade
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      clojure-mode
                      clojure-test-mode
                      nrepl))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;Loading iPython as python editor
;(setq load-path
;      (append (list nil
;                    "~/.emacs.d/python-mode-1.0/"
;		    "~/.emacs.d/pymacs/"
;		    "~/.emacs.d/ropemacs-0.6"
;                    )
;              load-path))
 
;(require 'ipython)
;(setq py-python-command-args '( "-colors" "Linux"))
 
;(defadvice py-execute-buffer (around python-keep-focus activate)
;  "return focus to python code buffer"
;  (save-excursion ad-do-it))
 
;(setenv "PYMACS_PYTHON" "python2.7") 
;(require 'pymacs)
 
;(pymacs-load "ropemacs" "rope-")
 
;(provide 'python-programming)
