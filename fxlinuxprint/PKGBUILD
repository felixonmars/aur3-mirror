# Maintainer: Nicolas Boichat <nicolas-aur at boichat dot ch>
pkgname=fxlinuxprint
pkgver=1.0.1
pkgrel=2
pkgdesc="FUJI XEROX driver for ApeosPort/DocuCentre printers"
arch=('i686' 'x86_64')
url="http://www.fujixerox.co.jp/download/apeosport/download/c4300series/linux_module.html"
license=('GPL')
depends=('cups')
source=('http://download.fujixerox.co.jp/pub/exe/apeosport/c4300series/fxlinuxprint-src-1.0.1.tar.gz')
md5sums=('7045d505e6fcb4c4455a40163ed72709')

build() {
  cd "${srcdir}/${pkgname}-src-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-src-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

