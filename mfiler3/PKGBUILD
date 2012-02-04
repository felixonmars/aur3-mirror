# Contributor: noonov <noonov@gmail.com>

pkgname=mfiler3
pkgver=4.4.9
pkgrel=1
pkgdesc="A feature-rich console file manager"
arch=('i686' 'x86_64')
url="http://ab25cq.sakura.ne.jp/"
license=('GPL2')
depends=('saphire>=3.6.5')
optdepends=('lv' 'vim')
source=(http://dl.sourceforge.jp/mfiler3/54457/${pkgname}-${pkgver}.tgz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc --with-optimize
  make -j1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make -j1 DESTDIR=${pkgdir} install
}

md5sums=('3f4942565b260e898d7ea60fb9474f95')
