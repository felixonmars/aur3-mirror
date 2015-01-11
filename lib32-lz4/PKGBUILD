# $Id: PKGBUILD 223704 2014-09-30 09:23:35Z seblu $
# Maintainer: Sébastien Luttringer

# Contacted by mail, author use svn commit as release version.
# He only push tested release code into svn and support using revision as version

pkgname=lib32-lz4
pkgver=123
pkgrel=1
pkgdesc='Very fast lossless compression algorithm'
arch=('i686' 'x86_64')
url='https://code.google.com/p/lz4/'
license=('GPL2')
makedepends=('svn')
checkdepends=('diffutils')
depends=('glibc')
source=("$pkgname::svn+http://lz4.googlecode.com/svn/trunk/#revision=$pkgver")
md5sums=('SKIP')

build() {
  export CC="gcc -march=i686 -m32"
  export CXX="g++ -march=i686 -m32"
  cd $pkgname
  make
}

check() {
  $pkgname/programs/lz4 /etc/passwd passwd.lz4
  $pkgname/programs/lz4 -d passwd.lz4 passwd
  diff -q /etc/passwd passwd
  rm passwd
}

package() {
  cd $pkgname
  make install DESTDIR="$pkgdir" LIBDIR="/usr/lib32"
  
  # Remove everything except for libraries.
  rm -rf ${pkgdir}/usr/{bin,include,share}
}

# vim:set ts=2 sw=2 et:
