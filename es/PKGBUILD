# Maintainer: Ian Denhardt <ian@zenhack.net>
pkgname=es
pkgver=0.9_beta1
pkgrel=1
pkgdesc="A functional shell with rc-inspired syntax"
arch=('i686' 'x86_64')
url="http://hawkwind.cs.toronto.edu:8001/mlists/es.html"
license=(custom)
depends=('readline')
source=(ftp://ftp.sys.utoronto.ca/pub/$pkgname/$pkgname-0.9-beta1.tar.gz stdlib.patch)
md5sums=('1d0f771d94d9d8f958f264f1757b8620' '096928f7457bd2d6500644d2134ec756')

build() {
  cd $srcdir/$pkgname-0.9-beta1

  # the "license" (public domain) is at the end of the README.
  tail -n 7 README > COPYING
  
  # allow stdlib.h to be included, so the package actually compiles.
  patch -Np1 -i $srcdir/stdlib.patch

  # use readline. it's a dependency of bash, so if you're able to use this PKGBUILD,
  # you should have it. Not strictly needed for es though, and editline is also supported.
  ./configure --prefix=/usr --mandir=/usr/share/man --with-readline || return 1
  make || return 1

  # build system doesn't respect DESTDIR, oh well, it's only a few files.
  install -Dm755 es $pkgdir/usr/bin/es || return 1
  install -Dm644 es.1 $pkgdir/usr/share/man/man1/es.1 || return 1
  install -Dm644 COPYING $pkgdir/usr/share/licenses/es/COPYING
  
}

# vim:set ts=2 sw=2 et:
