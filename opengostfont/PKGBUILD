pkgname=opengostfont
pkgver=0.3
pkgrel=2
pkgdesc="Open-source version of the fonts by Russian standard GOST 2.304-81 «Letters for drawings»"
arch=(any)
url="https://bitbucket.org/fat_angel/opengostfont/"
license=('GPL')
makedepends=('python2')
install=opengostfont.install
source=(https://bitbucket.org/fat_angel/opengostfont/downloads/opengostfont-src-$pkgver.tar.xz)
md5sums=('0e42456c80ba54a03d6784062e231073')

build() {
  cd "$srcdir/$pkgname-src-$pkgver"
  sed -i 's|python|python2|' genfonts.py
  make ttf otf
}

package() {
  cd "$srcdir/$pkgname-src-$pkgver"
  install -dm0755 $pkgdir/usr/share/fonts/{OTF,TTF}
  install -m0644 $pkgname-ttf-$pkgver/* $pkgdir/usr/share/fonts/TTF/
  install -m0644 $pkgname-otf-$pkgver/* $pkgdir/usr/share/fonts/OTF/
  install -Dm0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
