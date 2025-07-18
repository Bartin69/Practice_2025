# 📦 Защищённая конфигурация Raspberry OS

# Описание проекта
Данный проект посвящён разработке и внедрению защищённой конфигурации Raspberry OS для устройств Raspberry Pi, применяемых в образовательных и исследовательских целях.
Цель — повысить уровень безопасности устройства при сохранении его производительности и удобства использования.

Проект основан на:
    - официальной документации Raspberry OS и Raspberry Pi Foundation;
    - стандартах и руководствах по защите Linux (CIS Benchmarks, NIST SP 800‑123, STIG);
    - результатах собственных экспериментов и тестирования в учебной среде.

# 🛡 Основные меры защиты
✅ отключение ненужных сервисов
✅ смена стандартных паролей и настройка SSH‑ключей
✅ настройка файервола (iptables / ufw)
✅ установка и настройка Fail2Ban
✅ настройка журналирования событий безопасности (journalctl, auditd)
✅ регулярные обновления и автоматизация патчей
✅ минимизация привилегий пользователей и запрет root‑доступа по SSH
✅ мониторинг и уведомления о подозрительных событиях

# 📄 Состав репозитория
    
    ├── README.md               — описание проекта
    ├── setup.sh                — скрипт автоматизации настройки
    ├── configs/               — примеры конфигурационных файлов
    │   ├── ufw.rules.conf
    │   ├── sshd_config
    │   └── fail2ban_jail.local
    ├── logs/                   — логи
    │   ├── auth.log.snippet
    │   ├── hardening_report.log
    │   ├── nmap_scan_after.txt
    └── └── nmap_scan_before.txt

# 🚀 Быстрый старт

📥 Требования:
    - Raspberry Pi 4 B (или аналог) с Raspberry OS (bookworm);
    - Доступ по терминалу (локально или по SSH);
    - Права администратора (sudo);
