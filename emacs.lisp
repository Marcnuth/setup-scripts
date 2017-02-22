;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install necessary packages if not
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; list the packages you want
(setq package-list '(flymd f ecukes ert-runner el-mock markdown-mode image+ json-mode elpy helm helm-projectile))

(require 'package)
; list the repositories containing them
(setq package-archives '(("elpy" . "http://jorgenschaefer.github.io/packages/")
			 ("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.emacs-china.org/gnu/")
                         ("marmalade" . "http://elpa.emacs-china.org/marmalade/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")
                         ))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Following are the configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/marcnuth/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(display-time-mode t)
 '(line-number-mode nil)
 '(menu-bar-mode nil)
 '(python-shell-interpreter "python3")
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 113 :width normal))))
 '(cursor ((t (:background "yellow"))))
 '(highlight ((t (:background "chartreuse" :foreground "black"))))
 '(region ((t (:background "chartreuse" :foreground "black")))))

;; eshell: case insensitive matching
(setq eshell-cmpl-ignore-case t)


;; all backups goto ~/.backups instead of in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org

; colorful code block: http://orgmode.org/worg/org-contrib/babel/examples/fontify-src-code-blocks.html
(setq org-src-fontify-natively t)

(defface org-block-begin-line
  '((t (:underline "#3e6b99" :foreground "#ffffff" :background "#3e6b99")))
  "Face used for the line delimiting the begin of source blocks.")

(defface org-block-background
  '((t (:background "#222933")))
  "Face used for the source block background.")

(defface org-block-end-line
  '((t (:overline "#3e6b99" :foreground "#ffffff" :background "#3e6b99")))
  "Face used for the line delimiting the end of source blocks.")

;; org-mode
;; make org-mode support graphviz
;; http://shanth.xyz/mindmap_using_graphviz_orgmode.html#orgheadline3
(setq org-babel-python-command "python3")

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((dot . t)
	 (python . t)
	 )))


;; make emacs split horizontally
(setq split-height-threshold nil)
(setq split-width-threshold 0)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elpy
(elpy-enable)
(setq elpy-rpc-python-command "python3")

;; shortcut for elpy
(global-set-key (kbd "C-c l") 'elpy-shell-send-current-statement)
(global-set-key (kbd "C-c r") 'elpy-shell-send-region-or-buffer)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm
;; refer to http://tuhdo.github.io/helm-intro.html#orgheadline33

(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

;(setq helm-autoresize-max-height 0)
;(setq helm-autoresize-min-height 20)
;(helm-autoresize-mode 1)
; (helm-autoresize-mode t)

(helm-mode 1)

;;
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z



;;(defun pl/helm-alive-p ()
;;  (if (boundp 'helm-alive-p)
;;      (symbol-value 'helm-alive-p)))
;;(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)

(global-set-key (kbd "M-x") 'helm-M-x)
;(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;(global-set-key (kbd "C-x b") 'helm-mini)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)
;(global-set-key (kbd "C-c h o") 'helm-occur)
;(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
;(global-set-key (kbd "C-c h x") 'helm-register)
;(global-set-key (kbd "C-c h M-:") 'helm-eval-expression-with-eldoc)


(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)
(setq helm-locate-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)

(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

(require 'helm-eshell)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))


;; projectile, refers to http://tuhdo.github.io/helm-projectile.html
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-indexing-method 'alien)

