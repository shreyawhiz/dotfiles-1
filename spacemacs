;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers '(
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t)
     ansible
     better-defaults
     chrome
     colors
     docker
     elixir
     evil-cleverparens
     evil-commentary
     git
     go
     html
     ibuffer
     javascript
     (markdown :variables
               markdown-live-preview-engine 'vmd)
     nginx
     org
     osx
     ruby
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
     all-the-icons-dired
     dracula-theme
     evil-easymotion
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
   dotspacemacs-themes '(dracula spacemacs-dark)
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
   dotspacemacs-fullscreen-at-startup t
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
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

  (setq exec-path-from-shell-variables '(
    "PATH"
    "MANPATH"

    ;; Go path variables.
    "GOPATH"
    "GOROOT"
    "GOBIN"))
)

(defun dotspacemacs/user-init ()
  ;; Externalize custom generated configuration
  (setq custom-file "~/.spacemacs.custom")
  (load custom-file 'noerror)
  )

(defun dotspacemacs/user-config ()
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; User Interface
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Set theme
  (load-theme 'dracula t)

  ;; Use UTF-8 characters for powerline separator
  (setq powerline-default-separator nil)

  ;; Add vertical bar next to line numbers
  (setq linum-format "%4d \u2502 ")

  ;; Show current time on mode-line
  (display-time-mode t)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Navigation
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Easier split navigation
  (global-set-key (kbd "C-j") 'evil-window-down)
  (global-set-key (kbd "C-k") 'evil-window-up)
  (global-set-key (kbd "C-h") 'evil-window-left)
  (global-set-key (kbd "C-l") 'evil-window-right)

  ;; Neotree
  (setq neo-theme (if window-system 'icons 'arrow))
  (setq neo-hidden-regexp-list '("^\\." ".log$" "coverage" "dist" "node_modules"))
  (setq-default neo-show-hidden-files nil)

  ;; Projectile
  (setq projectile-enable-caching t)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Editing
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Never insert tabs
  (setq-default indent-tabs-mode nil)

  ;; Set preferred indent levels
  (defun my/set-indentationn (n)
    (setq-default
     css-indent-offset n
     evil-shift-width n
     js-indent-level n
     js2-basic-offset n
     sh-basic-offset n
     sh-indentation n
     web-mode-attr-indent-offset n
     web-mode-code-indent-offset n
     web-mode-css-indent-offset n
     web-mode-markup-indent-offset n
     )
    )

  (my/set-indentation 2)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Plugins
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; evil-easymotion
  (evilem-default-keybindings "SPC SPC")

  ;; Flycheck
  (defun my/flycheck/use-local-eslint ()
    (let* ((root (locate-dominating-file
                  (or (buffer-file-name) default-directory)
                  "node_modules"))
           (eslint (and root
                        (expand-file-name "node_modules/eslint/bin/eslint.js"
                                          root))))
      (when (and eslint (file-executable-p eslint))
        (setq-local flycheck-javascript-eslint-executable eslint)))
    )

  (add-hook 'flycheck-mode-hook #'my/flycheck/use-local-eslint)

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
