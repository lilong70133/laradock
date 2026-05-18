#!/bin/bash
# 确保 supervisord 配置包含 Laradock 的 supervisord.d 目录
SUPERVISORD_CONF="/etc/supervisor/supervisord.conf"
if [ -f "$SUPERVISORD_CONF" ] && ! grep -q "/etc/supervisord.d" "$SUPERVISORD_CONF"; then
    sed -i 's|files = /etc/supervisor/conf.d/\*.conf|files = /etc/supervisor/conf.d/*.conf /etc/supervisord.d/*.conf|' "$SUPERVISORD_CONF"
fi

# 确保 horizon 日志目录存在
mkdir -p /var/www/liyukj/b2c/admin/storage/logs
