(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your in it file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(global-visual-line-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(ns-right-alternate-modifier (quote none))
 '(org-log-done (quote time))
 '(tool-bar-mode nil)
 '(size-indication-mode t)
 '(scroll-bar-mode nil)
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; (require 'fill-column-indicator)

(global-linum-mode 1)
(setq inhibit-splash-screen t)

;; (load-theme 'deeper-blue)
;; (load-theme 'manoj-dark)
(load-theme 'leuven)

(setq-default overwrite-mode nil) ; <- überschreibt immer alles, egal ob markiert oder nicht
(setq-default delete-selection-mode t)

; start package.el with emacs
(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; initialize package.el
(package-initialize)
; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include")
  ;(add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include")
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)


;;;;;;;;;;;;;;;;;;;
;; spellchecking ;;
;;;;;;;;;;;;;;;;;;;
(setq-default ispell-program-name "/usr/local/bin/aspell")
;(setq-default ispell-program-name "/usr/local/bin/ispell")
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;;;;;;;;;;;;;
;; org-mode ;;
;;;;;;;;;;;;;;
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;;;;;;;;;;;;;;;
;; org-crypt ;;
;;;;;;;;;;;;;;;
(setq exec-path (append exec-path '("/usr/local/bin")))


(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))

(setq org-crypt-key nil)
;; GPG key to use for encryption
;; Either the Key ID or set to nil to use symmetric encryption.

(setq auto-save-default nil)
;; Auto-saving does not cooperate with org-crypt.el: so you need
;; to turn it off if you plan to use org-crypt.el quite often.
;; Otherwise, you'll get an (annoying) message each time you
;; start Org.

;; To turn it off only locally, you can insert this:
;;
;; # -*- buffer-auto-save-file-name: nil; -*-

;;;;;;;;;;;;;;;;
;; latex path ;;
;;;;;;;;;;;;;;;;
(setq exec-path (append exec-path '("/Library/TeX/texbin")))
(put 'set-goal-column 'disabled nil)
