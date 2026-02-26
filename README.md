# Dolphin Service Menus (Toolkit Completo)

Repositório para instalar, reproduzir e compartilhar atalhos personalizados no menu de contexto do Dolphin.

## O que este repositório instala

- Configuração base do Dolphin:
  - `files/config/hypr/dolphin/dolphinrc`
- Service menus em `~/.local/share/kio/servicemenus`:
  - `Abrir no terminal aqui`
  - `Copiar caminho absoluto`
  - `Descompactar > Extrair aqui`
  - `Descompactar > Extrair para pasta com o mesmo nome`
  - `Executar no terminal`
  - `Comprimir > Comprimir para ZIP`
  - `Comprimir > Comprimir para TAR.GZ`
  - `Ferramentas > Duplicar com timestamp`
  - `Ferramentas > Gerar SHA256 e copiar`
  - `Ferramentas > Tornar executável (chmod +x)`
  - `Ferramentas > Remover executável (chmod -x)`
  - `Abrir no editor`
  - `Abrir como root`
- Scripts auxiliares em `~/.local/bin`:
  - `dolphin-open-terminal`
  - `dolphin-copy-path`
  - `dolphin-extract`
  - `dolphin-run-in-terminal`
  - `dolphin-compress`
  - `dolphin-chmod`
  - `dolphin-sha256-copy`
  - `dolphin-open-editor`
  - `dolphin-duplicate-timestamp`
  - `dolphin-open-as-root`

## Estrutura do projeto

```text
files/
  config/hypr/dolphin/dolphinrc
  local/share/kio/servicemenus/*.desktop
  local/bin/dolphin-*
install.sh
scripts/export-from-system.sh
scripts/verify.sh
```

Os arquivos `.desktop` do repositório usam `@HOME@` nos comandos `Exec`.  
Durante `./install.sh`, esse placeholder é substituído automaticamente pelo diretório real do usuário.

Por requisito de segurança do Dolphin/KIO, os service menus instalados no diretório do usuário são gravados com permissão executável (`0755`).

## Requisitos

- KDE Dolphin (KDE Frameworks 6)
- `kitty` (terminal preferencial)
- `bsdtar` (extração principal)
- `zip` e `tar` (compressão)
- `sha256sum` (hash)
- `kwriteconfig6` e `kbuildsycoca6` (normalmente já presentes no KDE)
- `pkexec` (para o atalho `Abrir como root`)
- Opcional: `7z`, `wl-copy` ou `xclip`, `code`, `nvim`

## Instalação

```bash
git clone https://github.com/bernardopg/dolphin-servicemenus.git
cd dolphin-servicemenus
./install.sh
```

Se os atalhos não aparecerem imediatamente, feche e abra o Dolphin.

## Verificação rápida

```bash
./scripts/verify.sh
```

## Atualizar o repositório a partir do sistema local

Depois de ajustar algo no seu ambiente:

```bash
./scripts/export-from-system.sh
git status
```

## Segurança

- `Abrir como root` usa `pkexec` e abre uma nova janela do Dolphin com privilégios elevados.
- Use essa opção apenas quando necessário.

## Licença

Este projeto está licenciado sob a [MIT License](./LICENSE).
