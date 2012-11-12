(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(ede-project-directories (quote ("c:/Users/kchimala/main/client/fido/10-CA024-P1/ftd_srr/AppLayer"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



; To keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)

; for debugging issues during emacs startup
(setq stack-trace-on-error t)

; perforce integration
(load-file "~/p4.el")

; to show line numbers on the left side of edit 
; window 
(add-to-list 'load-path "~/elpa/nlinum-1.0/")
(load-file "~/elpa/nlinum-1.0/nlinum.el")
(global-linum-mode 1) 
(setq column-number-mode t)
;; CEDET
(load-file "~/cedet/common/cedet.el")

;use project manager
(global-ede-mode t)                  

; default all tabs to spaces
(setq-default indent-tabs-mode nil)  

(semantic-load-enable-excessive-code-helpers)
(require 'semantic-ia)          ; names completion and display of tags
(require 'semantic-gcc)         ; auto locate system include files

(require 'semanticdb)
(global-semanticdb-minor-mode 1)

(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-c+" 'semantic-tag-folding-show-block)
  (local-set-key "\C-c-" 'semantic-tag-folding-fold-block)
  (local-set-key "\C-c\C-c+" 'semantic-tag-folding-show-all)
  (local-set-key "\C-c\C-c-" 'semantic-tag-folding-fold-all)
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)

(global-semantic-tag-folding-mode 1)

(require 'eassist)

;(concat essist-header-switches ("hh" "cc"))
(defun alexott/c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

;; gnu global support
(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;; ctags
(require 'semanticdb-ectag)
(semantic-load-enable-primary-exuberent-ctags-support)
;;(global-semantic-idle-tag-highlight-mode 1)

;; ecb 
(add-to-list 'load-path "~/ecb-2.40/")
(require 'ecb)
(ecb-activate)
