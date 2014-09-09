# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Arthur Danskin <arthurdanskin@gmail.com>
# Contributor: Jason Taylor <jftaylor21@tntech.edu>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=tclreadline
pkgver=2.1.0
pkgrel=8
arch=(i686 x86_64)
pkgdesc="Makes the GNU readline available for tcl shells."
url="http://tclreadline.sourceforge.net"
license="BSD"
depends=(tcl readline)
options=('!libtool')
install=tclreadline.install
source=(http://switch.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
        threads.patch
        config.sub.patch)
md5sums=('219d0247a1373578080940ebde53bdd0'
         '80fedcebddbba5cf6a1bf810454e123f'
         'aca2bfbc3d768af326b574951230dbf1')


prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -p0 < $srcdir/threads.patch
  patch -p0 < $srcdir/config.sub.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
