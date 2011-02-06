# Contributor: Your Name <youremail@domain.com>

pkgname=rhythmbox-equalizer
pkgver=1.0
pkgrel=1
pkgdesc="Equalizer plugin for Rhythmbox"
url="http://www.deviantdark.altervista.org/?p=438"
arch=('i686' 'x86_64')
license=('unknown')
groups=()
depends=(rhythmbox)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=(plugin.install)
source=(http://www.deviantdark.altervista.org/uploads/rhythmbox-equalizer.tar.gz)
noextract=()
md5sums=('75f4ccf95f103884324352d5abf9dc54')

build() {
  mkdir -p $pkgdir/usr/lib/rhythmbox/plugins/
  cp -R $srcdir/equalizer $pkgdir/usr/lib/rhythmbox/plugins/
}
