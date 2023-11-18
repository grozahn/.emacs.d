(use-package use-package
  :no-require
  :custom
  (use-package-enable-imenu-support t))

(use-package early-init
  :no-require
  :unless (featurep 'early-init)
  :config
  (load-file (locate-user-emacs-file "early-init.el")))

(use-package cus-edit
  :custom
  (custom-file (expand-file-name "custom.el" user-emacs-directory))
  :init
  (load custom-file :noerror))

(use-package files
  :custom
  (make-backup-files nil)
  (auto-save-default nil))

(use-package ask-yn
  :no-require t
  :init
  (fset 'yes-or-no-p 'y-or-n-p))

(use-package display-line-numbers
  :hook ((text-mode . display-line-numbers-mode)
         (prog-mode . display-line-numbers-mode)
         (conf-mode . display-line-numbers-mode)
         (display-line-numbers-mode . hl-line-mode))

  :custom
  (display-line-numbers-width 4)
  (display-line-numbers-grow-only t)
  (display-line-numbers-width-start t)
  (display-line-numbers-type 'relative))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode))

(use-package vterm
  :ensure t
  :when (bound-and-true-p module-file-suffix)
  :requires project
  :custom
  (vterm-always-compile-module t)
  (vterm-environment '("VTERM=1"))
  (vterm-max-scrollback 1000)
  (vterm-kill-buffer-on-exit t))

(use-package company
  :ensure t
  :bind (:map
         company-active-map
         ("TAB" . company-complete-common-or-cycle)
         ("<tab>" . company-complete-common-or-cycle)
         ("<S-Tab>" . company-select-previous)
         ("<backtab>" . company-select-previous)
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :hook (prog-mode . company-mode)
  :custom
  (company-idle-delay 0.2)
  (company-require-match 'never)
  (company-minimum-prefix-length 2)
  (company-tooltip-align-annotations nil))
