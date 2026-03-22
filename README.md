<h1 align="center">Pokedex</h1> <p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter Badge">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart Badge">
  <img src="https://img.shields.io/badge/MobX-FF6600?style=for-the-badge&logo=mobx&logoColor=white" alt="MobX Badge">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License Badge">
  <img src="https://img.shields.io/badge/Status-Concluído-brightgreen.svg" alt="Status Badge">
</p>

🌟 Visão Geral

Bem-vindo à Pokedex! Este aplicativo mobile, desenvolvido em Flutter, oferece uma experiência rica e interativa para explorar o vasto universo Pokémon. Com uma interface intuitiva e design responsivo, a Pokedex permite aos usuários navegar por uma lista abrangente de Pokémon, visualizar detalhes específicos de cada criatura e descobrir suas características únicas. É a ferramenta perfeita para treinadores e entusiastas que desejam ter todas as informações sobre seus Pokémon favoritos na palma da mão. 🚀


✨ Funcionalidades

•
Listagem de Pokémon: Explore uma lista completa de Pokémon com rolagem infinita.

•
Detalhes do Pokémon: Acesse informações detalhadas sobre cada Pokémon, incluindo tipo, habilidades, estatísticas e descrições.

•
Pesquisa: Encontre Pokémon específicos rapidamente através da funcionalidade de busca.

•
Design Responsivo: Experiência de usuário otimizada para diferentes tamanhos de tela e dispositivos.

🛠️ Tecnologias e Ferramentas

Este projeto foi construído utilizando as seguintes tecnologias e bibliotecas:

•
Linguagem: Dart

•
Framework: Flutter

•
Gerenciamento de Estado: MobX (com mobx_codegen e flutter_mobx)

•
Requisições HTTP: uno

•
Injeção de Dependência: get_it

•
Imagens em Cache: cached_network_image

•
Indicadores de Progresso: percent_indicator

•
Geração de Cores: palette_generator

🏗️ Arquitetura e Padrões

O projeto segue uma arquitetura modular e organizada, inspirada nos princípios de Clean Architecture e MVVM (Model-View-ViewModel), com o uso de MobX para gerenciamento de estado. A estrutura de pastas reflete essa separação de responsabilidades:

•
lib/models: Contém as classes de modelo de dados.

•
lib/services: Responsável pela comunicação com APIs externas (ex: PokeAPI).

•
lib/stores: Implementa a lógica de negócios e o gerenciamento de estado utilizando MobX.

•
lib/screens: Define as interfaces de usuário (Views).

•
lib/widgets: Componentes de UI reutilizáveis.

Essa abordagem garante um código limpo, testável e de fácil manutenção, promovendo a escalabilidade do aplicativo. 📐

🚀 Como Executar (Getting Started)

Siga estas instruções para configurar e executar o projeto localmente:

1.
Clone o repositório:

Bash


git clone https://github.com/geovannifranca/pokedex.git
cd pokedex





2.
Instale as dependências:

Bash


flutter pub get





3.
Gere os arquivos MobX (se necessário ):

Bash


flutter pub run build_runner build --delete-conflicting-outputs





4.
Execute o aplicativo:

Bash


flutter run



Certifique-se de ter um emulador ou dispositivo físico conectado e configurado para desenvolvimento Flutter.



✍️ Autor/Contato

Desenvolvido com paixão por:

Geovanni

