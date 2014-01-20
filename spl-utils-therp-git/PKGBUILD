# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
# Contributor: Kyle Fuller <inbox at kylefuller dot co dot uk>

pkgname="spl-utils-therp-git"
pkgrel=1
pkgver=0.6.2_r23.g4c99541
pkgdesc="Solaris Porting Layer kernel module support files."
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=(git://github.com/zfsonlinux/spl.git
        spl-utils.hostid)
groups=("archzfs")
license=("GPL")
makedepends=("gcc" "make" "autoconf" "git")
conflicts=('spl-utils-therp')

pkgver() {
  cd "$srcdir/spl"
  git describe --long | sed -E 's/-([^-]*-g)/_r\1/;s/-/./g;s/spl\.//'
}

build() {
  cd "$srcdir/spl"
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --sbindir=/usr/bin \
              --with-config=user
  make
}

package() {
  cd "$srcdir/spl"
  make DESTDIR=$pkgdir install

  install -D -m644 $srcdir/spl-utils.hostid $pkgdir/etc/hostid
}
md5sums=('SKIP'
         'a54f0041a9e15b050f25c463f1db7449')
