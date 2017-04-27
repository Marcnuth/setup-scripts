;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install necessary packages if not
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; list the packages you want
(setq package-list '(flymd f ecukes ert-runner el-mock markdown-mode image+ json-mode elpy realgud ivy swiper counsel web-mode ess bing-dict))

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
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(display-time-mode t)
 '(line-number-mode nil)
 '(menu-bar-mode nil)
 '(python-shell-interpreter "ipython3")
 '(python-shell-interpreter-args "-i --simple-prompt")
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(cursor ((t (:background "yellow"))))
 '(highlight ((t (:background "chartreuse" :foreground "black"))))
 '(region ((t (:background "chartreuse" :foreground "black")))))

;; eshell: case insensitive matching
(setq eshell-cmpl-ignore-case t)


;; all backups goto ~/.backups instead of in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))



;; auto linum mode when python modex
(dolist (hook '(python-mode-hook
		c-mode-common-hook))
  (add-hook hook (lambda () (linum-mode t))))


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

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "python")))  ; don't ask for this lang
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)


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



(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; web-mode


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))


(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-comment-keywords t)
(setq web-mode-enable-current-element-highlight t)

(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))


;;;;;;;;;;;;;;;;;;;;;;;
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))


;;;;;;
;; bing dict
(global-set-key (kbd "C-c d") 'bing-dict-brief)
