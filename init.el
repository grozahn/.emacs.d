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
