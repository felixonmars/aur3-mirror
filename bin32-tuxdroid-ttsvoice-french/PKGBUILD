# Contributor: Christophe Gueret <tolgam@homegnu.net>
pkgname=bin32-tuxdroid-ttsvoice-french
pkgver=1
pkgrel=1
pkgdesc="French voice pack to use with TTS daemon for the TuxDroid"
arch=('x86_64')
url="http://www.tuxisalive.com"
license=('custom')
groups=()
depends=('tuxsetup' 'lib32-libstdc++5')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('http://www.tuxisalive.com/Members/remi/for-tuxsetup-and-voices-release/voice-files-tar.gz/tuxdroid-tts-voices.French.tar.gz')
noextract=()
md5sums=('58d4eca1b136687ae1bdbcd4dfe7e4ed')

build() {
  mkdir -p $startdir/pkg/opt/Acapela/TelecomTTS/babtts/engines
  cp -r $startdir/src/tuxdroid-tts-voices.French/French $startdir/pkg/opt/Acapela/TelecomTTS/babtts/engines
  mkdir -p $startdir/pkg/usr/share/licenses/tuxdroid-ttsvoice-french
  ln -s /usr/share/licenses/tuxsetup/ACAPELALICENSE $startdir/pkg/usr/share/licenses/tuxdroid-ttsvoice-french/ACAPELALICENSE
}

