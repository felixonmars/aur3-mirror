# Contributor: David Spicer <azleifel at gmail dot com>

pkgname=xine-ui-vdr-hg
_hgrepo="xine-ui"
pkgver=r3151.702c252f3200
pkgrel=1
pkgdesc="A free media player (main development branch) with VDR keys enabled"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.xine-project.org"
depends=('curl' 'desktop-file-utils' 'hicolor-icon-theme' 'libxft'
         'libxss' 'libxxf86vm' 'lirc-utils' 'shared-mime-info' 'tar'
         'xdg-utils' 'xine-lib')
makedepends=('mercurial' 'libxt' 'pkg-config')
provides=('xine-ui' 'xine-ui-vdr')
conflicts=('xine-ui' 'xine-ui-vdr')
options=('!emptydirs')
install=xine-ui.install
source=('hg+http://hg.code.sf.net/p/xine/xine-ui')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_hgrepo"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$_hgrepo"

  ./autogen.sh --prefix=/usr --mandir=/usr/share/man \
    --enable-vdr-keys \
    --without-aalib \
    --without-caca

  make
}

package() {
  cd "$srcdir/$_hgrepo"
  make DESTDIR="${pkgdir}" install
}
