;; Responsible for setting up my agda mode.

;; Some chars get inconsistent heights. unicode-fonts
;; fixes this problem.
(require 'unicode-fonts)
(unicode-fonts-setup)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq-default show-trailing-whitespace t)

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))


;; find agda mode
;; Lisandras emacs doesnt like the agda-mode locate; so we just hard code it!
;; You will need to update this manually for newer agda versions
;; (load-file (let ((coding-system-for-read 'utf-8))
;;                  (shell-command-to-string "agda-mode locate")))

;; Fix agda2-mode shortcuts
(eval-after-load 'agda2-mode '(progn
  (define-key agda2-mode-map (kbd "M-<right>")
    'agda2-goto-definition-keyboard)
  (define-key agda2-mode-map (kbd "M-<left>")
    'agda2-go-back)
  (define-key evil-normal-state-map [mouse-2]
    'agda2-goto-definition-mouse)))

;; load other relevant files for my agda mode.
(load (expand-file-name "~/.emacs.d/local/agda-tag.el"))
