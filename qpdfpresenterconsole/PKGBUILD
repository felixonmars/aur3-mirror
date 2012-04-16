# Maintainer: Sébastien Lacroix <erufu.sennin@gmail.com>
pkgname=qpdfpresenterconsole
pkgver=2.5.13
pkgrel=2
pkgdesc="A Keynote-like presentation tool for PDF (e.g. beamer)"
arch=('i686' 'x86_64')
url="https://gitorious.org/qpdfpresenterconsole/"
license=('custom')
makedepends=('cmake' 'asciidoc')
depends=('poppler-qt' 'vlc' 'qtwebkit')
source=(https://gitorious.org/qpdfpresenterconsole/qpdfpresenterconsole/archive-tarball/v$pkgver)
md5sums=('38ebcf676cded5f01f0b340473f73814')

build() {
  cd "$srcdir/${pkgname}-${pkgname}/"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
}

package() {
  cd "$srcdir/${pkgname}-${pkgname}/build/"
  make DESTDIR="$pkgdir/" install

  install -d -m755 ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m644 ${srcdir}/${pkgname}-${pkgname}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}
}

post_install() {
    update-desktop-database -q
}



