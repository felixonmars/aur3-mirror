# Maintainer: Thorsten Vogt <vogtt at gmx dot net>

pkgname=xrootconsole
pkgver=0.6
pkgrel=1
pkgdesc="Tails a file in a window on your X11 root window"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/xrootconsole/"
license=('GPL')
depends=()
source=(http://downloads.sourceforge.net/project/xrootconsole/xrootconsole/${pkgver}/xrootconsole-${pkgver}.tar.gz)
md5sums=('c3570d420eb5ae9f98385bc48c636fc4') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed 's/\/usr\/local/\/usr/' Makefile >> Makefile.new
  mv Makefile.new Makefile
  make
  gzip xrootconsole.1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "xrootconsole" "${pkgdir}/usr/bin/xrootconsole"
  install -Dm644 "xrootconsole.1.gz" "${pkgdir}/usr/share/man/man1/xrootconsole.1.gz"
}

