# Maintainer: Adam Nielsen <malvineous@shikadi.net>

pkgname=modplugtools
pkgver=0.5.3
pkgrel=2
pkgdesc="libmodplug utilities modplugplay and modplug123"
arch=('i686' 'x86_64')
url="http://modplug-xmms.sourceforge.net/"
license=('custom')
depends=('gcc-libs' 'libmodplug' 'libao')
options=('!libtool')
source=("http://downloads.sourceforge.net/modplug-xmms/${pkgname}-${pkgver}.tar.gz")
md5sums=('502b9a11e41219ceb7f2322d7521e2b3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
