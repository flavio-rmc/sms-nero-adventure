# SMS Nero Adventure

Protótipo de um jogo homebrew para **Sega Master System**, concebido como um prequel não oficial de *Phantasy Star I*. A campanha acompanha Nero antes dos acontecimentos do jogo original e acontece exclusivamente em versões originais dos labirintos já conhecidos de Algol.

> Projeto de fã, sem afiliação ou licença da SEGA. Não inclui ROMs, mapas extraídos, gráficos, música ou outros assets do jogo original.

## Estado

O repositório começa com uma ROM-base que inicializa o VDP do Master System, limpa a VRAM e mostra uma tela azul de diagnóstico. É uma fundação pequena, deliberadamente sem dependências, compilável com SDCC.

## Compilar no Windows

1. Instale o [SDCC](https://sdcc.sourceforge.net/).
2. Execute:

   ```powershell
   .\tools\build.ps1
   ```

3. Abra `build/sms-nero-adventure.sms` em um emulador de Master System.

## Direção do projeto

Leia [docs/game-design.md](docs/game-design.md) para a premissa, escopo e regras de adaptação dos labirintos. A primeira meta é um vertical slice navegável de uma masmorra, com exploração em primeira pessoa, combate por turnos e persistência simples.

## Licença

O código deste repositório é disponibilizado sob a licença MIT; veja [LICENSE](LICENSE). Elementos de *Phantasy Star* permanecem propriedade de seus respectivos titulares.
