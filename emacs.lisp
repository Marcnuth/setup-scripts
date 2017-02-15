;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install necessary packages if not
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; list the packages you want
(setq package-list '(flymd f ecukes ert-runner el-mock markdown-mode image+ json-mode elpy))

(require 'package)
; list the repositories containing them
(setq package-archives '(("elpy" . "http://jorgenschaefer.github.io/packages/")
			 ("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
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


;; all backups goto ~/.backups instead of in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))

(setq org-log-done 'note)
(setq org-agenda-window-setup 'current-window)



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


;; elpy
(elpy-enable)
(setq elpy-rpc-python-command "python3")

