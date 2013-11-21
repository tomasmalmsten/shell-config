;; Always ALWAYS use UTF-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

(column-number-mode t)  ; show column numbers
(global-linum-mode t) ;Show line numbers on each line

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

(global-set-key (kbd "C-z") 'undo) ; Ctrl+z
(global-set-key (kbd "C-S-z") 'redo) ;  Ctrl+Shift+z

;; Add .emacs.d to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path "~/.emacs.d")

;;Add ~/lib/lisp to load-path
(add-to-list 'load-path "~/lib/lisp/")

;;Set up package manager, such as melpa and marmalade
(require 'package)
(setq package-archives
             '(
                 ("melpa" . "http://melpa.milkbox.net/packages/")
                 ("marmalade" . "http://marmalade-repo.org/packages/")
                 ("elpa" . "http://tromey.com/elpa/")
                 ("gnu" . "http://elpa.gnu.org/packages/")
               ))
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
;;Done with package manager

(require 'auto-complete)
(global-auto-complete-mode t)

(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(require 'slime)
(slime-setup)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'js2-refactor)

(require 'buster-mode)

(setq ispell-dictionary "english")
