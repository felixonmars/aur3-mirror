# Contributor: Oleg Alekseenko <al_oleg [at] bk.ru>

pkgname=sakura-scrollback-patch
_pkgname=sakura
pkgver=2.3.8
pkgrel=1
pkgdesc="A terminal emulator based on GTK and VTE with scrollback patch (adds scroll_lines option to sakura.conf)."
arch=('i686' 'x86_64')
url="http://pleyades.net/david/sakura.php"
license=('GPL')
depends=('vte' 'libxft' 'desktop-file-utils')
makedepends=('cmake')
provides=('sakura')
conflicts=('sakura')
source=(http://pleyades.net/david/projects/$_pkgname/$_pkgname-$pkgver.tar.bz2 \
	sakura_scrollback.patch)

install=sakura.install
md5sums=('5ce4c9498ea5eb909dbd03617087202e'
         '064c2afcafccf6ad36bc9263c4b7953e')
build() {
  cd $srcdir/${_pkgname}-${pkgver}

  # Adds scrollback patch
  patch -Np0 -i ${srcdir}/sakura_scrollback.patch || return 1
   
  # build & install	
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE . || return 1
  make || return 1
}

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}

