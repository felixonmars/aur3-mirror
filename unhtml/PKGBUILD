# Maintainer: Renato Budinich <rennabh at gmail dot com>
pkgname=unhtml
pkgver=2.3.9
pkgrel=3
pkgdesc="Removes all HTML tags from an HTML file and directs its output to stdout"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/unhtml"
license=('GPL')
depends=('glibc')
provides=('')
source=(http://ftp.de.debian.org/debian/pool/main/u/unhtml/unhtml_2.3.9.tar.gz)
md5sums=('bd9994c40f84df2c64d489247670c58f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch Makefile "$startdir/Makefile.patch" 

  make 
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install 
}

# vim:set ts=2 sw=2 et:
