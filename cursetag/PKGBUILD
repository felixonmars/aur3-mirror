# Maintainer: Onni R. <onnir at iki dot fi>
pkgname=cursetag
pkgver=4
pkgrel=1
license=('None')
pkgdesc="an ncurses based audio metadata (tag) editor"
arch=('i686' 'x86_64')
url="http://github.com/lotuskip/cursetag"
depends=('taglib' 'ncurses')
source=(http://github.com/downloads/lotuskip/cursetag/$pkgname-$pkgver.tar.gz)
md5sums=('33c3931704f97fd8ad95f54dce448eba')

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  cd $srcdir/$pkgname
  mv -f cursetag ${pkgdir}/usr/bin
  mv -f cursetag.1 ${pkgdir}/usr/share/man/man1/
}
