;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers '(
     ansible
     chrome
     colors
     docker
     elixir
     evil-cleverparens
     evil-commentary
     go
     html
     javascript
     (markdown :variables markdown-live-preview-envine 'vmd)
     nginx
     org
     osx
     search-engine
     shell
     shell-scripts
     spell-checking
     syntax-checking
     typescript
     version-control
     vim-empty-lines
     vimscript
     vinegar
     yaml)
   dotspacemacs-additional-packages '(
     all-the-icons
     dracula-theme
     evil-smartparens)
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(dracula spacemacs-dark monokai zenburn)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '(
     "Knack Nerd Font"
     :size 14
     :weight normal
     :width normal
     :powerline-scale 1.5)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab t
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'all
   )
  )

(defun dotspacemacs/user-init ()
  )

(defun dotspacemacs/user-config ()
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; User Interface
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Set theme
  (load-theme 'dracula t)

  ;; Use UTF-8 characters for powerline separator
  (setq powerline-default-separator 'slant)

  ;; Add vertical bar next to line numbers
  (setq linum-format "%4d \u2502 ")

  ;; Show current time on mode-line
  (display-time-mode t)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Navigation
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Set C-w to delete word backward in INSERT mode
  (with-eval-after-load 'company (define-key company-active-map (kbd "C-w") 'evil-delete-backward-word))
  (with-eval-after-load 'helm (define-key helm-map (kbd "C-w") 'evil-delete-backward-word))

  ;; Easier split navigation
  (global-set-key (kbd "C-j") 'evil-window-down)
  (global-set-key (kbd "C-k") 'evil-window-up)
  (global-set-key (kbd "C-h") 'evil-window-left)
  (global-set-key (kbd "C-l") 'evil-window-right)

  ;; Neotree
  (setq neo-theme (if window-system 'icons 'arrow))

  ;; Projectile
  (setq projectile-enable-caching t)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Editing
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Set preferred indent levels
  (setq-default js2-basic-offset 2
                js-indent-level 2)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Plugins
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Enable evil-smartparens
  (smartparens-global-mode t)
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

  ;; Show diff margins for all buffers
  '(version-control :variables
                    version-control-global-margin t)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Miscellaneous
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Enter command-line mode easier
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#373b41"))
 '(compilation-message-face (quote default))
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#3a3a3a" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#20240E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#20240E" . 100))))
 '(hl-sexp-background-color "#121212")
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (perspective escreen go-guru tern evil-smartparens yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vimrc-mode uuidgen use-package toc-org tide typescript-mode tagedit spacemacs-theme spaceline powerline slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs request rainbow-mode rainbow-identifiers rainbow-delimiters pug-mode popwin persp-mode pcre2el pbcopy paradox spinner osx-trash osx-dictionary org-projectile org-present org-pomodoro alert log4e gntp org-plus-contrib org-download org-bullets open-junk-file ob-elixir org nginx-mode neotree multi-term move-text mmm-mode markdown-toc lorem-ipsum livid-mode skewer-mode simple-httpd linum-relative link-hint less-css-mode launchctl js2-refactor yasnippet multiple-cursors js2-mode js-doc jinja2-mode jabber fsm insert-shebang info+ indent-guide ido-vertical-mode hydra hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile helm-flx helm-descbinds helm-css-scss helm-ag haml-mode google-translate golden-ratio go-eldoc go-mode gnuplot gmail-message-mode ham-mode markdown-mode html-to-markdown git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-commit with-editor git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck-mix flycheck flx-ido flx fish-mode fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-commentary evil-cleverparens smartparens paredit evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help engine-mode emmet-mode edit-server dumb-jump dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diminish diff-hl dactyl-mode column-enforce-mode color-identifiers-mode coffee-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-dictionary ansible-doc ansible f s all-the-icons font-lock+ alchemist company dash elixir-mode pkg-info epl aggressive-indent adaptive-wrap ace-window ace-link helm avy helm-core popup async quelpa package-build ace-jump-helm-line)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
