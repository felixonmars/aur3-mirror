# Maintainer: Bart Verhoeven <nepherte at archlinux dot us>

pkgname=tadpole
pkgver=0.8
pkgrel=2
pkgdesc="A Tagger, Lemmatizer, Morphological Analyzer and Dependency Parser for Dutch"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('mbt' 'python2' 'boost' 'icu')
makedepends=()
url="http://ilk.uvt.nl/tadpole"
source=("http://ilk.uvt.nl/downloads/pub/software/$pkgname-$pkgver.tar.gz"
        "fix-configdir.patch"
        "fix-python2.patch")
sha256sums=('2c343aeeddb23451bb4a95339bf7e8def59ebb36fa6c21a9aa4a71bf0dfaad4c'
            'e7727617e695d734c45322c74926cd63ec7d7cb76575498c9e5674dc0decc84b'
            '4ebb03dbcd8f565d82a2582beee4e44f33f353072d40e2fb712850f76a2c679d')

build() {
  cd $srcdir/$pkgname-$pkgver

  patch -Np0 < $srcdir/fix-python2.patch
  patch -Np0 < $srcdir/fix-configdir.patch
  PYTHON_VERSION=2.7 ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
