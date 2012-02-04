# Contributor: Dale Ogilvie <pnyli0002@sneakemail.com>
pkgname=kio-sword
pkgver=0.3
pkgrel=1
pkgdesc="KDE ioslave for sword"
arch=(i686)
url="http://lukeplant.me.uk/kio-sword/"
license="GPL"
depends=('kdebase' 'sword')
source=(http://optusnet.dl.sourceforge.net/sourceforge/kio-sword/kio_sword-${pkgver}.tar.gz)
md5sums=('957c563737d47900f67661086732ee12')

build() {
  cd $startdir/src/kio_sword-$pkgver
  patch -p0 < sword_1_5_8_fix.patch || return 1
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg install
}
