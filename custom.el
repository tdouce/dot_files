(setq mac-command-modifier 'meta)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elpy company-jedi yaml-mode dockerfile-mode clojure-mode rainbow-identifiers rainbow-delimiters paredit company zop-to-char zenburn-theme which-key volatile-highlights vkill undo-tree smartrep smartparens smart-mode-line projectile ov operate-on-number move-text markdown-mode magit json-mode imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region exec-path-from-shell editorconfig easy-kill discover-my-major diminish diff-hl crux browse-kill-ring beacon anzu ace-window ido flx-ido smex cider)))
 '(safe-local-variable-values (quote ((flycheck-disabled-checkers emacs-lisp-checkdoc)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ido
(require 'ido)
(global-set-key (kbd "C-x b") 'ido-switch-buffer)
(ido-mode t)

;; paredit
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook       'enable-paredit-mode)
(add-hook 'lisp-mode-hook             'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook           'enable-paredit-mode)
(add-hook 'clojure-mode-hook          'enable-paredit-mode)

(message "loading paredit")

;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(require 'smex) ; Not needed if you use package.el
(smex-initialize)

;; cider
(require 'cider)
(add-hook 'cider-mode-hook #'eldoc-mode)
(setq cider-prefer-local-resources t)
(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
(setq backup-directory-alist `(("." . "~/.saves")))
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook
          (lambda ()
            (define-key cider-repl-mode-map (kbd "C-c M-o") 'cider-repl-clear-buffer)
            (define-key cider-repl-mode-map (kbd "C-c M-l") 'cider-repl-switch-to-other)))

(setq cider-repl-display-help-banner nil)

;; Line numbers
(global-linum-mode t)

(setq helm-M-x-fuzzy-match t)

;; Mouse scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; (eval-after-load 'clojure-mode '(progn
;;                                   (define-key clojure-mode-map (kbd "C-M-]") 'paredit-forward-slurp-sexp)
;;                                   (define-key clojure-mode-map (kbd "C-M-[") 'paredit-forward-barf-sexp))))



;; Python - autocompletion
(package-initialize)
(elpy-enable)

(defun pydb ()
  "Insert a python debugger statement"
  (interactive)
  (insert "import pdb; pdb.set_trace()"))

;;;; Ruby - http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/
;; Robe
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; Autocomplete methods
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/.cask/24.3.50.1/elpa/auto-complete-20130724.1750/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;; Automplete syntax (i.e. parens, end statements, etc)
(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)
;;;; Ruby - end
