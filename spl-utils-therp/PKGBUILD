# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
# Contributor: Kyle Fuller <inbox at kylefuller dot co dot uk>

pkgname=("spl-utils-therp")
pkgver=0.6.3_1.2
github_pkg=spl-${pkgver/_/-}
pkgrel=1
pkgdesc="Solaris Porting Layer kernel module support files."
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=(https://github.com/zfsonlinux/spl/archive/${github_pkg}.tar.gz)
groups=("archzfs")
license=("GPL")
makedepends=("gcc" "make" "autoconf")
depends=("spl-hostid")

build() {
  cd "$srcdir/spl-${github_pkg}"
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --sbindir=/usr/bin \
              --with-config=user
  make
}

package() {
  cd "$srcdir/spl-${github_pkg}"
  make DESTDIR=$pkgdir install
}

md5sums=('105d4abcaa9801be0034dba29a1951d1')
