;; �Զ��庯��
(setq default-file-name-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
;; f2�������ļ�
(defun open-my-init-file()
  (interactive)
  (find-file "C:/Users/һֻ��/AppData/Roaming/.emacs.d/init.el")
)
(global-set-key (kbd "<f2>") 'open-my-init-file)
;; ����word�ļ�
(defun create-doc()
  (interactive)
  (org-export-dispatch (kbd "<return>")) 
  (setq gr-tmp-name (substring (buffer-name) 0 -4))
  ;;(message gr-tmp-name)
  ;;(shell-command "chcp 936")
  (shell-command (concat "iconv -t UTF-8 " gr-tmp-name ".tex >" gr-tmp-name "_.tex"))
  (shell-command (concat "pandoc " gr-tmp-name "_.tex -o " gr-tmp-name ".docx"))
  (shell-command (concat "echo" gr-tmp-name))
  (shell-command "del *.tex")
  (shell-command "exit")
)
(global-set-key (kbd "<f3>") 'create-doc)

;; �Զ���Ĭ������
(set-foreground-color "#E0DFDB")
(set-background-color "#102372")
(toggle-truncate-lines t)
;;(global-tool-bar-mode -1)
(scroll-bar-mode -1)
(linum-mode t)
;; �رջ�ӭ����
(setq inhibit-startup-message t)

;;ͼ�Ļ���
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)

;; ��װ���--------------------------------------------------------------------------------------------
;; ע�� elpa.emacs-china.org �� Emacs China ���������ڹ��ڴ��һ�� ELPA ����
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		monokai-theme
		web-mode
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))
;;--------------------------------------------------------------------------------------------
;; �������
(load-theme 'monokai t)

(require 'org-tempo)

;; ����򿪵��ļ�
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; vim���
(evil-mode 1)

;; �Զ�����
(global-company-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(yasnippet angular-snippets emmet-mode company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

;; org-download
(setq make-backup-files nil)

(add-to-list 'load-path
                "~/path-to-yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


;;  agenda config
    ;;(setq org-agenda-files '("D:/gr/work/web/emacs_learning"))
(setq org-agenda-files (list "D:/gr/work/web/emacs_learning"
			     "D:/gr/work/��˾��/0-�ճ�ͳ��"
			     ))
    (global-set-key (kbd "C-c a") 'org-agenda)

;;=====
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

