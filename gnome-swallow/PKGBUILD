pkgname=gnome-swallow
pkgver=1.2
pkgrel=1
pkgdesc="Applet that keeps a window inside the panel."
url="http://interreality.org/~tetron/technology/swallow/"
license="GPL"
depends=('gnome-panel' 'libgnomeui')
makedepends=('')
arch=('i686')
source=(http://interreality.org/~tetron/technology/swallow/${pkgname}-${pkgver}.tar.gz patch-v4-debian.diff)

md5sums=('9a278a8b5031957f7ca4f5f99044ba8e'
         'd258f2167bc46c802b88a0bb3bf82182')



build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	echo Patching...
	patch -p1 < ../patch-v4-debian.diff
	echo Running autoreconf
	autoreconf || return 1
	echo Running ./configure
	./configure --prefix='/usr/' || return 1
	echo Running make
	make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo Running make install
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

