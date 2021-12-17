;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jason Axelson"
      user-mail-address "jason.axelson@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
;;(load-theme 'doom-one-light t)
;;(load-theme 'doom-one t)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;;;;;
;; Shortcuts
;;;;;;
(define-key evil-normal-state-map (kbd "C-n") 'evil-mc-make-and-goto-next-match)
(define-key evil-visual-state-map (kbd "C-n") 'evil-mc-make-and-goto-next-match)
(define-key evil-normal-state-map (kbd "C-p") 'evil-mc-make-and-goto-prev-match)
(define-key evil-visual-state-map (kbd "C-p") 'evil-mc-make-and-goto-prev-match)
(define-key evil-normal-state-map (kbd "C-t") 'evil-mc-skip-and-goto-next-match)
(define-key evil-visual-state-map (kbd "C-t") 'evil-mc-skip-and-goto-next-match)

;; TODO: Make this elixir specific
(define-key evil-insert-state-map (kbd "M-_") #'jax-insert-elixir-pipe)
(define-key evil-insert-state-map (kbd "M-\\") #'jax-insert-elixir-pipe)
(define-key evil-insert-state-map (kbd "M-=") #'jax-insert-fat-arrow)

(define-key evil-insert-state-map (kbd "C-d") 'delete-forward-char)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)

(define-key evil-normal-state-map (kbd "SPC w SPC") 'delete-other-windows)

(define-key evil-insert-state-map (kbd "s-/") 'comment-line)
(define-key evil-normal-state-map (kbd "s-/") 'comment-line)
(define-key evil-normal-state-map (kbd "C-/") 'comment-line)

(define-key general-override-mode-map (kbd "M-o") 'ace-window)
(define-key general-override-mode-map (kbd "M-j") 'evil-window-down)
(define-key general-override-mode-map (kbd "M-k") 'evil-window-up)
(define-key general-override-mode-map (kbd "M-h") 'evil-window-left)
(define-key general-override-mode-map (kbd "M-l") 'evil-window-right)
;; (define-key markdown-mode-map (kbd "M-l") 'evil-window-right)

(define-key general-override-mode-map (kbd "M-u") 'embark-act)
(define-key general-override-mode-map (kbd "M-;") 'er/expand-region)

(define-key evil-normal-state-map (kbd "SPC TAB p") '+workspace/switch-left)
(define-key evil-normal-state-map (kbd "SPC w D") 'ace-delete-window)
(define-key evil-normal-state-map (kbd "SPC w M") 'ace-swap-window)
(define-key evil-normal-state-map (kbd "SPC p R") 'projectile-replace)
(define-key evil-normal-state-map (kbd "SPC b TAB") 'previous-buffer)
(define-key evil-normal-state-map (kbd "SPC c /") 'evilnc-copy-and-comment-lines)
(define-key evil-normal-state-map (kbd "SPC TAB <") '+workspace/swap-left)
(define-key evil-normal-state-map (kbd "SPC TAB >") '+workspace/swap-right)

(define-key evil-visual-state-map (kbd "s-/") 'evilnc-comment-operator)
(define-key evil-visual-state-map (kbd "C-/") 'evilnc-comment-operator)

;; Make C-v yank
;; Note: Use `C-q' to do quoted insert instead of C-v
(define-key evil-insert-state-map (kbd "C-v") 'yank)

;; Trying to get an autocorrect to work. Having trouble with the dictionary.
(map! :i "C-i" #'flyspell-auto-correct-word)

;;;;;;
;; Settings
;;;;;;
(setq doom-localleader-key ",")
;; TODO: Rebind , to some other key?

(setq display-line-numbers-type nil)
;; TODO: this doesn't work, instead need to set it after visual-line-mode is enabled
(setq word-wrap nil)
(setq wrap-prefix "↩")
;; I'm not sure this is really working
(setq whitespace-style '(face tabs tab-mark spaces space-mark trailing lines-tail))

;; Faster than the default scp
(setq tramp-default-method "ssh")

(setq standard-indent 2)
(setq js-indent-level 2)

;; The default fontsize was too large
(setq doom-font (font-spec :family "Source Code Pro" :size 12))

;; Make ace-window keys on the home row
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
;; Make ace always dispatch
(setq aw-dispatch-always t)
(setq aw-dispatch-alist
      '((?x aw-delete-window "Delete Window")
	(?m aw-swap-window "Swap Windows")
	(?M aw-move-window "Move Window")
	(?c aw-copy-window "Copy Window")
	(?j aw-switch-buffer-in-window "Select Buffer")
	(?n aw-flip-window)
	(?u aw-switch-buffer-other-window "Switch Buffer Other Window")
	(?c aw-split-window-fair "Split Fair Window")
	(?v aw-split-window-vert "Split Vert Window")
	(?b aw-split-window-horz "Split Horz Window")
        (?o jax-aw-maximize-window "Maximize Window")
	;; (?o delete-other-windows "Delete Other Windows")
	(?? aw-show-dispatch-help)))

(defun jax-aw-maximize-window (window)
  "Select buffer in WINDOW."
  (aw-switch-to-window window)
  (doom/window-maximize-buffer))

(setq standard-indent 2)
(setq js-indent-level 2)
(setq css-indent-offset 2)

;; https://github.com/emacs-lsp/lsp-mode/issues/713
(setq lsp-enable-file-watchers nil)

;; Enable folding
(setq lsp-enable-folding t)

;; Avy configuration
;; reference: https://karthinks.com/software/avy-can-do-anything
(setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?e ?r ?v ?c ?i ?u ?m ?,))
(setq avy-timeout-seconds 0.30)

(defun avy-action-kill-whole-line (pt)
  (save-excursion
    (goto-char pt)
    (kill-whole-line))
  (select-window
   (cdr
    (ring-ref avy-ring 0)))
  t)

(defun avy-action-copy-whole-line (pt)
  (save-excursion
    (goto-char pt)
    (cl-destructuring-bind (start . end)
        (bounds-of-thing-at-point 'line)
      (copy-region-as-kill start end)))
  (select-window
   (cdr
    (ring-ref avy-ring 0)))
  t)

(defun avy-action-teleport-whole-line (pt)
    (avy-action-kill-whole-line pt)
    (save-excursion (yank)) t)

(defun avy-action-help (pt)
  (save-excursion
    (goto-char pt)
    (lsp-describe-thing-at-point))
  (select-window
   (cdr (ring-ref avy-ring 0)))
  t)

(defun avy-action-paste (pt)
  (save-excursion
    (goto-char pt)
    (yank))
  t)

(defun avy-action-embark (pt)
  (unwind-protect
      (save-excursion
        (goto-char pt)
        (embark-act))
    (select-window
     (cdr (ring-ref avy-ring 0))))
  t)

(defun avy-action-mark-to-char (pt)
  (activate-mark)
  (goto-char pt))

(use-package! avy
  :config
  (setf (alist-get ?. avy-dispatch-alist) 'avy-action-embark
        (alist-get ?p avy-dispatch-alist) 'avy-action-paste
        ;; Note: this is space
        (alist-get ?M avy-dispatch-alist) 'avy-action-mark-to-char
        (alist-get ?y avy-dispatch-alist) 'avy-action-copy
        (alist-get ?Y avy-dispatch-alist) 'avy-action-copy-whole-line
        (alist-get ?H avy-dispatch-alist) 'avy-action-help
        (alist-get ?T avy-dispatch-alist) 'avy-action-teleport-whole-line))

;; Emabark configuration
(use-package marginalia
  :config
  (marginalia-mode))

(use-package embark
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ;;("C-;" . embark-dwim)        ;; good alternative: M-.
   ;;("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'
   )

  :init

  ;; Optionally replace the key help with a completing-read interface
  ;; (setq prefix-help-command #'embark-prefix-help-command)

  :config
  (define-key embark-identifier-map (kbd "g") 'lsp-find-definition)

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; (defun )

;; Add origami and LSP integration
(use-package! lsp-origami)
(add-hook! 'lsp-after-open-hook #'lsp-origami-try-enable)

(after! lsp-mode
  (setq lsp-ui-doc-enable nil))

;; https://mandarvaze.bitbucket.io/post/vuejs-with-doom-emacs-nvm/
(add-hook 'vue-mode-hook #'lsp!)

;; current (2021-04-17) rg base command
;; ("rg" "--max-columns" "240" "--with-filename" "--no-heading" "--line-number" "--color" "never" "%s")
;;(setq counsel-rg-base-command '("rg" "--max-columns" "240" "--with-filename" "--no-heading" "--line-number" "--color" "never" "-Tsh" "%s"))

;;;;;;
;; Other
;;;;;;
(map! :after elixir-mode
      :map elixir-mode-map
      :localleader
      "," #'jax-exunit-rerun
      "f" #'lsp-format-buffer)

(map! :after elixir-mode
      :map elixir-mode-map
      :localleader
      :prefix "t"
      "t" #'exunit-verify-single
      "T" #'exunit-toggle-file-and-test-other-window
      "b" #'exunit-verify
      ;;"a" #'exunit-verify-all
      "TAB" #'exunit-toggle-file-and-test)

(map! :after web-mode
      :map web-mode-map
      :localleader
      "f" #'prettier-prettify)

(map! :after typescript-mode
      :map typescript-mode-map
      :localleader
      "f" #'prettier-prettify)

(map! :after markdown-mode
      :map markdown-mode-map
      "C-j" 'markdown-next-visible-heading
      "C-k" 'markdown-previous-visible-heading)

;; Elixir: Ignore some common directories that don't need to be watched
(after! lsp-mode
  (dolist (match
           '("[/\\\\].direnv$"
             "[/\\\\]node_modules$"
             "[/\\\\]deps"
             "[/\\\\]build"
             "[/\\\\]_build"))
    (add-to-list 'lsp-file-watch-ignored match)))

;; Tree-sitter configuration
;; https://gist.github.com/ananthakumaran/ed91ef5a7bbf679cdf13e8a65ea54abe
(use-package! tree-sitter
  :init
  (defface tree-sitter-hl-face:warning
    '((default :inherit font-lock-warning-face))
    "Face for parser errors"
    :group 'tree-sitter-hl-faces)

  (defun hook/tree-sitter-common ()
    (unless font-lock-defaults
      (setq font-lock-defaults '(nil)))
    (setq tree-sitter-hl-use-font-lock-keywords nil)
    (tree-sitter-mode +1)
    (tree-sitter-hl-mode +1))

  (defun hook/elixir-tree-sitter ()
    (require 'f)
    (require 's)

    (setq tree-sitter-hl-default-patterns
     (read
      (concat
       "["
       (s-replace "#match?" ".match?"
                  (f-read-text (expand-file-name "~/dev/forks/tree-sitter-elixir/queries/highlights.scm")))
       "]")))
    (hook/tree-sitter-common))

  :hook ((elixir-mode . hook/elixir-tree-sitter))
  :custom-face
  (tree-sitter-hl-face:operator ((t)))
  (tree-sitter-hl-face:variable ((t)))
  (tree-sitter-hl-face:function.method.call ((t)))
  (tree-sitter-hl-face:property ((t))))

(use-package! tree-sitter-langs
  :after tree-sitter
  :config
  (add-to-list 'tree-sitter-major-mode-language-alist '(elixir-mode . elixir)))

;; Disable smie for elixir
;; https://discord.com/channels/406534637242810369/406554085794381833/871578567304171570
(setq-hook! 'elixir-mode-hook font-lock-defaults nil)
(font-lock-flush)

;; By default evil-mc overrides registers (i.e. ones that would be pasted with `"ap'),
;; this restores them after evil-mc is exited
;; https://github.com/gabesoft/evil-mc/issues/83
(with-eval-after-load 'evil-mc
  (setq evil-mc-cursor-variables
        (mapcar
          (lambda (s)
            (remove 'register-alist
                    (remove 'evil-markers-alist
                            (remove evil-was-yanked-without-register s))))
          evil-mc-cursor-variables)))

(defun jax-insert-elixir-pipe ()
  (interactive)
  (insert "|> "))

(defun jax-insert-fat-arrow ()
  (interactive)
  (insert "=> "))

(defun jax-fold-exunit-buffer ()
  (interactive)
  (with-current-buffer "*exunit-compilation*<elixir-ls>"
    (goto-char (point-min))
    (evil-vimish-fold/create (point) (line-end-position 6))))

;; With this version we don't lose magit diff markers in the current buffer
(defun jax-exunit-rerun ()
  (interactive)
  (save-buffer)
  (exunit-rerun))

(defvar jax-exunit-fold-timer nil
  "Timer for folding exunit buffer")

(defun jax-fold-exunit-wait ()
  (interactive)
  (when jax-exunit-fold-timer
    (cancel-timer jax-exunit-fold-timer))
  (run-with-timer 1 nil #'jax-fold-exunit-buffer))

;; TODO: Figure out how to pass/receive start-at prefix argument
(defun jax-rectangle-number-lines (start end &optional format)
  (interactive "r")
  (rectangle-number-lines start end 0))

;; From wiki: https://www.emacswiki.org/emacs/RectangleCommands
;; Might not keep since I don't typcially use the rectangle kill ring
(defun jax-yank-replace-rectangle (start end)
  "Similar like yank-rectangle, but deletes selected rectangle first."
  (interactive "r")
  (delete-rectangle start end)
  (pop-to-mark-command)
  (yank-rectangle))

(add-hook 'exunit-compilation-mode-hook #'jax-fold-exunit-wait)

(set-popup-rule! "*exunit-compilation*" :side 'bottom :size .35 :select nil :vslot 2)
(set-popup-rule! "*Flycheck errors*" :side 'bottom :size .30 :select nil :vslot 3)

;; smartparens tends to slow typing down tremendously when too many pairs are defined for a mode so Doom replaces smartparens-elixir by default. Uncomment the following lines to re-enable it
;;(delq 'smartparens-elixir features)
;;(after! elixir-mode (require 'smartparens-elixir))
