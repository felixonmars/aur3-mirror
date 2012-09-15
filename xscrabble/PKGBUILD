# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: pressh <pressh at gmail dot com>

pkgname=xscrabble
pkgver=2.12
pkgrel=4
pkgdesc="An X11 implementation of the Scrabble board game"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?XScrabble"
license=('GPL')
depends=('bzip2' 'libxaw' 'zlib')
makedepends=('imake')
optdepends=('xscrabble-en: English language files'
            'xscrabble-fr: French language files')
source=(ftp://ftp.ac-grenoble.fr/ge/educational_games/$pkgname-$pkgver.tar.bz2
        $pkgname.patch
        $pkgname.desktop)
md5sums=('733e90def2c1d60c0c223f3a0c908db9'
         '55b60aaaac58ccc7ba43c7e823b2d583'
         'b2c6472d28a51cfd8a50e42cf3a32871')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  patch -Np1 -i "$srcdir"/$pkgname.patch

  # uncomment this line if you want to use the French language files by default
  #sed -i "s_en/_fr/_" XScrabble

  ./build bin
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -Dm755 src/xscrabble "$pkgdir"/usr/bin/xscrabble
  install -m755 src/xscrab "$pkgdir"/usr/bin/xscrab
  install -Dm644 XScrabble "$pkgdir"/usr/share/X11/app-defaults/XScrabble
  install -Dm644 src/$pkgname.xpm "$pkgdir"/usr/share/pixmaps/$pkgname.xpm
  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -m644 CHANGES "$pkgdir"/usr/share/doc/$pkgname/CHANGES
}
