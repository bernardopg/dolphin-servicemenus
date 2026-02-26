# Dolphin Service Menus (Kitty + Extract + Run)

Repositorio para reproduzir e compartilhar minha configuracao de atalhos no menu de contexto do Dolphin.

## O que este repo instala

- `dolphinrc` base (origem: `~/.config/hypr/dolphin/dolphinrc`)
- Service menus em `~/.local/share/kio/servicemenus`:
  - `Abrir no terminal aqui`
  - `Copiar caminho absoluto`
  - `Descompactar > Extrair aqui`
  - `Descompactar > Extrair para pasta com o mesmo nome`
  - `Executar no terminal`
- Scripts auxiliares em `~/.local/bin`:
  - `dolphin-open-terminal`
  - `dolphin-copy-path`
  - `dolphin-extract`
  - `dolphin-run-in-terminal`

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

## Requisitos

- KDE Dolphin (KDE Frameworks 6)
- `kitty` (terminal preferencial)
- `bsdtar` (extracao principal)
- `kwriteconfig6` e `kbuildsycoca6` (normalmente no KDE)
- Opcional: `7z`, `wl-copy` ou `xclip`

## Instalacao

```bash
git clone https://github.com/bernardopg/dolphin-servicemenus.git
cd dolphin-servicemenus
./install.sh
```

Se os itens nao aparecerem na hora, feche e abra o Dolphin.

## Atualizar o repo a partir do sistema atual

Depois de ajustar algo localmente:

```bash
./scripts/export-from-system.sh
git status
```

## Observacao sobre seu setup Hypr

No meu caso, `~/.config/dolphinrc` e um symlink para `~/.config/hypr/dolphin/dolphinrc`.
O `install.sh` detecta isso e grava no alvo correto automaticamente.
