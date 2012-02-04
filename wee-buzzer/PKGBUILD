# Maintainer: Alfredo 'IceCoder' Mungo <chimeranet89@gmail.com>
pkgname=wee-buzzer
pkgver=1.1
pkgrel=1
epoch=20120130
pkgdesc="Weechat buzzer add-on that informs you when you receive a private message or are mentioned on a channel."
arch=(any)
url="http://code.google.com/p/wee-buzzer/"
license=('GPL3')
groups=()
depends=('weechat>=0.3.6-2' 'python>=3.2.2-2')
makedepends=('gzip' 'tar')
checkdepends=()
optdepends=('alsa-utils: to use the quick "aplay" sound player (which is default)')
provides=()
conflicts=()
replaces=()
backup=()
options=(zipman)
install=
changelog=
source=('http://wee-buzzer.googlecode.com/files/wee-buzzer-1.1.tar.gz')
noextract=()
sha1sums=('2cb3f74fe2627513af9075d82e2e5c93d99b60b5')

package() {
  cd "$srcdir"
  
  install -D "man/wee-buzzer.7" "$pkgdir/usr/share/man/man7/wee-buzzer.7"
  install -D wee-buzzer.py "$pkgdir/usr/share/weechat/scripts/wee-buzzer.py"
  install -D wee-buzzer-alert.wav "$pkgdir/usr/share/sounds/icecoder/wee-buzzer-alert.wav"

  echo "wee-buzzer: Type 'man wee-buzzer' for information about how to enable the plugin."
  echo "wee-buzzer: Users from version 1.0 will now have to reset their preferences from within weechat. Please consult the manual to see the variables and their meaning."
}
