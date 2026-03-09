#!/bin/bash
# --- Script de Diagnóstico de Servidor ---
# Autor: DaviInfra

echo "=========================================="
echo "   SISTEMA DE MONITORAMENTO - INFRA      "
echo "=========================================="

# 1. Checagem de Recursos
echo -e "\n[+] USO DE MEMÓRIA RAM:"
free -h

echo -e "\n[+] ESPAÇO EM DISCO:"
df -h | grep '^/dev/'

# 2. Segurança (Verifica se o Firewall está de pé)
echo -e "\n[+] STATUS DO FIREWALL (UFW):"
if command -v ufw > /dev/null; then
    sudo ufw status | grep "Status" || echo "Firewall instalado, mas inativo."
else
    echo "UFW (Firewall) não encontrado."
fi

# 3. Rede
echo -e "\n[+] TESTE DE CONECTIVIDADE (Google DNS):"
ping -c 3 8.8.8.8 | grep 'avg'

echo -e "\n=========================================="
echo "         VERIFICAÇÃO CONCLUÍDA           "
echo "=========================================="
