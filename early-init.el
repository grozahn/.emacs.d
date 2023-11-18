;; Speed up startup
(setq
 gc-cons-threshold most-positive-fixnum
 read-process-output-max (* 1024 1024 4) ; 4mb
 inhibit-compacting-font-caches t
 message-log-max 16384
 package-enable-at-startup nil
 load-prefer-newer noninteractive)


(setq-default
 default-frame-alist '((width . 170)
                       (height . 56)
                       (tool-bar-lines . 0)
                       (bottom-divider-width . 0)
                       (right-divider-width . 1))
 initial-frame-alist default-frame-alist
 frame-inhibit-implied-resize t
 x-gtk-resize-child-frames 'resize-mode
 fringe-indicator-alist (assq-delete-all 'truncation fringe-indicator-alist))

(unless (or (daemonp) noninteractive)
  (when (fboundp #'tool-bar-mode)
    (tool-bar-mode -1))

  (when (fboundp #'menu-bar-mode)
    (menu-bar-mode -1))

  (when (fboundp #'scroll-bar-mode)
    (scroll-bar-mode -1)))

(when (featurep 'native-compile)
  (setq native-comp-deferred-compilation t)
  (defvar native-comp-async-report-warnings-errors)
  (setq native-comp-async-report-warnings-errors 'silent))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(provide 'early-init)
