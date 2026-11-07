#!/usr/bin/env bash
# Baixa a tag do Firefox usada como base e aplica o patch queue em patches/.
#
# Uso:
#   bash scripts/fetch-upstream.sh [destino]
#
# Padrão de destino: upstream/ (ignorado pelo git).
# Se o destino já existir, o script para: ele não sobrescreve nada.
# Para refazer do zero, remova o diretório manualmente.

set -euo pipefail

TAG="FIREFOX_159_0_RELEASE"
REPO_URL="https://github.com/mozilla-firefox/firefox.git"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="${1:-$ROOT/upstream}"

if [ -e "$DEST" ]; then
  echo "erro: $DEST já existe. Remova o diretório para refazer." >&2
  exit 1
fi

echo "==> clonando $REPO_URL @ $TAG (shallow)"
git clone --depth 1 --branch "$TAG" "$REPO_URL" "$DEST"

shopt -s nullglob
patches=("$ROOT"/patches/*.patch)
shopt -u nullglob

if [ ${#patches[@]} -eq 0 ]; then
  echo "==> nenhum patch em patches/; upstream pronto sem modificações"
  exit 0
fi

echo "==> aplicando ${#patches[@]} patch(es)"
git -C "$DEST" \
  -c user.name="clean-browser-ci" \
  -c user.email="ci@clean-browser.invalid" \
  am --3way "${patches[@]}"

echo "==> pronto: $DEST"
