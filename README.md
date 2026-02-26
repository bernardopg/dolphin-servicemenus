# Dolphin Service Menus (Complete Toolkit)

Repositorio para reproduzir e compartilhar minha configuracao de atalhos no menu de contexto do Dolphin.

## O que este repo instala

- `dolphinrc` base em `files/config/hypr/dolphin/dolphinrc`
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
  - `Ferramentas > Tornar executavel (chmod +x)`
  - `Ferramentas > Remover executavel (chmod -x)`
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

## Estrutura

```text
files/
  config/hypr/dolphin/dolphinrc
  local/share/kio/servicemenus/*.desktop
  local/bin/dolphin-*
install.sh
scripts/export-from-system.sh
scripts/verify.sh
```

Os arquivos `.desktop` no repo usam `@HOME@` nos comandos `Exec`.
Durante `./install.sh`, esse placeholder e substituido pelo diretorio real do usuario.
Eles tambem sao instalados com permissao executavel (`0755`), exigencia de seguranca do Dolphin/KIO para service menus em pasta de usuario.

## Requisitos

- KDE Dolphin (KDE Frameworks 6)
- `kitty` (terminal preferencial)
- `bsdtar` (extracao principal)
- `zip` e `tar` (compressao)
- `sha256sum` (hash)
- `kwriteconfig6` e `kbuildsycoca6` (normalmente no KDE)
- `pkexec` (atalho Abrir como root)
- Opcional: `7z`, `wl-copy` ou `xclip`, `code`, `nvim`

## Instalacao

```bash
git clone https://github.com/bernardopg/dolphin-servicemenus.git
cd dolphin-servicemenus
./install.sh
```

Se os itens nao aparecerem na hora, feche e abra o Dolphin.

## Seguranca

- `Abrir como root` usa `pkexec` e abre uma nova janela do Dolphin com privilegios elevados.
- Use apenas quando necessario e evite editar/deletar em massa como root.

## Atualizar o repo a partir do sistema atual

Depois de ajustar algo localmente:

```bash
./scripts/export-from-system.sh
git status
```
