#!/bin/bash
set -e

# Verifica se está em um repositório Git
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Este diretório não é um repositório Git."
    exit 1
fi

# Gera nome da branch com a data atual
BRANCH_NAME=$(date +"%Y-%m-%d")
echo "📁 Criando e trocando para a branch: $BRANCH_NAME"
git checkout -b "$BRANCH_NAME"

# Adiciona todas as alterações
echo "➕ Adicionando alterações..."
git add .

# Solicita a mensagem de commit
read -p "📝 Digite a mensagem de commit: " COMMIT_MSG
git commit -m "$COMMIT_MSG"

# Volta para a main
echo "🔁 Trocando para a branch main..."
git checkout main

# Faz o merge da branch de data
echo "🔀 Fazendo merge da branch '$BRANCH_NAME' na main..."
git merge "$BRANCH_NAME"

# Envia para o repositório remoto
echo "🚀 Enviando alterações para o repositório remoto (main)..."
git push origin main

# Deleta a branch criada
echo "🧹 Deletando a branch temporária '$BRANCH_NAME'..."
git branch -d "$BRANCH_NAME"

echo "✅ Código versionado com sucesso!"