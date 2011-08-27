# maintainer: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=sqcheck
pkgver=0.4.1
pkgrel=4
pkgdesc="A viewer for image sequences - camera capture or animation"
arch=('i686' 'x86_64')
url="http://sqview.sourceforge.net/"
license=('GPL2')
depends=('freeimage' 'fltk' 'mesa' 'hicolor-icon-theme' 'libxinerama')
makedepends=()

source=(http://downloads.sourceforge.net/sqview/$pkgname-$pkgver.tar.gz
	sqcheck.desktop
	fltk13_compat_header.patch)
sha1sums=('04b2fae79dc562a20dc36b72c5f8bf7ee57cc2a9'
	'd02d673dd0242675121e2d768697b8d76bad7b67'
	'3c88d4531b75e6dc1a935aef63b21bde8ae196cb')

build() {
  cd ${srcdir}
  patch -p0 -i fltk13_compat_header.patch

  cd ${srcdir}/${pkgname}-${pkgver}
  make

  install -Dm755 bin/sqcheck ${pkgdir}/usr/bin/sqcheck
  install -Dm644 ${srcdir}/sqcheck.desktop ${pkgdir}/usr/share/applications/sqcheck.desktop
  install -Dm644 gui/sqcheck_128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/sqcheck.png
}
