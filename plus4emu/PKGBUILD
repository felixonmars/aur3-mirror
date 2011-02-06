# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=plus4emu
pkgver=1.2.9.2
pkgrel=1
pkgdesc="An emulator of the Commodore 264 computers family (Plus/4, C16 and C116)"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL')
depends=('mesa' 'libgl' 'sdl>=1.2' 'portaudio>=18' 'fltk>=1.1')
makedepends=('scons')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('3b71aed343a341f62e688dd5bc5b9d1f')

build() {
  cd $pkgname-$pkgver

  scons || return 1

  install -Dm755 makecfg "$pkgdir"/usr/bin/p4makecfg
  install -m755 p4sconv plus4emu tapconv "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/$pkgname
  cp -rf roms/ "$pkgdir"/usr/share/$pkgname/
}
