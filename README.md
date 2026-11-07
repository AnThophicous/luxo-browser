# clean-browser

Fork experimental do Firefox, baseado na tag [`FIREFOX_159_0_RELEASE`](https://github.com/mozilla-firefox/firefox/releases/tag/FIREFOX_159_0_RELEASE).

O objetivo é mudar a **aparência** do navegador: interface mais limpa, dinâmica e leve. O motor fica como está, salvo mudanças pontuais futuras e documentadas.

## Como o repo funciona

- Este repo **não guarda o código-fonte do Firefox**. Ele guarda só o *patch queue*: a pasta `patches/` tem commits lógicos aplicados em cima da tag.
- `scripts/fetch-upstream.sh` baixa a tag da Mozilla para `upstream/` e aplica os patches em ordem com `git am`.
- O GitHub Actions roda esse processo a cada push e a cada pull request (ver `.github/workflows/ci.yml`).

Para rodar localmente:

```bash
bash scripts/fetch-upstream.sh
```

## Marca

Este projeto **não é o Firefox oficial** e não usa a marca "Firefox" nem os logos da Mozilla, conforme a política de marca da Fundação Mozilla. Nome e identidade visual próprios serão definidos antes de qualquer distribuição.

## Licença

Código sob a [Mozilla Public License 2.0](LICENSE), a mesma licença do Firefox.

## Status

Estrutura inicial. Ainda não há mudanças de interface.
