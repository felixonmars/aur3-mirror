pkgname=qtdmm
pkgver=0.9.0
pkgrel=1
pkgdesc="A QT digital multimeter display"
url="http://www.mtoussaint.de/qtdmm.html"
license="GPL3"
depends=(qt4)
makedepends=(qt4)
arch=('i686' 'x86_64')
source=("http://www.mtoussaint.de/qtdmm-$pkgver.tgz")
sha256sums=('d5513055f2b9566d55946c0355fda845fd30c34c3a96c24eabd8ef346a8559ea')

build() {
  export QT_SELECT=4
  cd "$srcdir/QtDMM-$pkgver/src"
  qmake
  make
}

package() {
  cd "$srcdir/QtDMM-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/usr/share/pixmaps
  install -m0755 bin/qtdmm $pkgdir/usr/bin
  install -m0644 QtDMM.desktop $pkgdir/usr/share/applications
  install -m0644 qtdmm.png $pkgdir/usr/share/pixmaps
  install -m0644 qtdmm.1 $pkgdir/usr/share/man/man1
  rm -f $pkgdir/usr/share/man/man1/qtdmm.1.gz
  gzip $pkgdir/usr/share/man/man1/qtdmm.1
}
