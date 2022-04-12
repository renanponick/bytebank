# Pré-Requisitos
Após instalar o Flutter, [baixe](https://developer.android.com/studio) e 
[instale](https://developer.android.com/studio/install) o Android Studio para
acessar o Android SDK e criar um emulador Android. 
[Instruções para criar um emulador](https://developer.android.com/studio/run/managing-avds#createavd)

# Criar um projeto no Flutter

```bash
# Verifica as configurações atuais do flutter
flutter doctor
# Cria o novo projeto
flutter create <nome_do_projeto>
# Rodar o projeto
cd <nome_do_projeto>
flutter run
```

Se receber uma mensagem de "No supported devices connected". Execute:

```bash
# Consulte os emuladores disponiveis
flutter emulator
# Vincule o emulador na execução
flutter emulator --launch Pixel_2_API_30
# Rode o projeto
flutter run
```