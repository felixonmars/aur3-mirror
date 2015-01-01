# Maintainer: Anugrah Redja Kusuma <anugrah.redja@gmail.com>
pkgname=tunesviewer
pkgver=1.5.2
pkgrel=1
pkgdesc="A small, easy to use program to access itunes-university media and podcasts in Linux."
arch=('any')
url="http://tunesviewer.sourceforge.net/"
license=('Apache')
depends=('python2-lxml' 'pywebkitgtk' 'desktop-file-utils' 'hicolor-icon-theme')
provides=("tunesviewer=${pkgver}")
source=("http://downloads.sourceforge.net/project/tunesviewer/${pkgname}_${pkgver}.deb")
noextract=("${pkgname}_${pkgver}.deb")
install="tunesviewer.install"
md5sums=('90b2952249411bfef18eadc84ce79bf3')

build() {
  cd "$srcdir"
  ar x "${pkgname}_${pkgver}.deb"
}

package() {
  cd "$pkgdir"
  tar xJf "$srcdir/data.tar.xz"
  sed -i 's/env python/env python2/g' `find "$pkgdir/" -name *.py`
}
