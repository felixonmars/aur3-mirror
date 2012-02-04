# Contributor: noonov <noonov@gmail.com>

pkgname=saphire
pkgver=3.6.5
pkgrel=1
pkgdesc="A command-line shell for mfiler3"
arch=('i686' 'x86_64')
url="http://ab25cq.sakura.ne.jp/"
license=('GPL2')
depends=('oniguruma' 'gc')
source=(http://dl.sourceforge.jp/sash/54458/${pkgname}-${pkgver}.tgz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc --with-optimize
  make -j1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make -j1 DESTDIR=${pkgdir} install
}

md5sums=('0c2c595c6ba616ded997bdbfb68e5e1c')
