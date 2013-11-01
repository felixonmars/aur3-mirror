# Maintainer: jtts
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>

_pkgbase=cracklib
pkgname=lib32-$_pkgbase
pkgver=2.9.0
pkgrel=3
pkgdesc="Password Checking Library (32-bit)"
arch=('x86_64')
license=('GPL')
url="http://sourceforge.net/projects/cracklib"
depends=('lib32-glibc' 'lib32-zlib' "$_pkgbase")
makedepends=('gcc-multilib')
source=(http://downloads.sourceforge.net/sourceforge/$_pkgbase/$_pkgbase-$pkgver.tar.gz)
md5sums=('e0f94ac2138fd33c7e77b19c1e9a9390')

build() {
  cd $srcdir/$_pkgbase-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --libdir=/usr/lib32 --without-python CC='gcc -m32'
  make
}

#check() {
#  cd $srcdir/$pkgname-$pkgver
#  make check
#}

package() {
  cd $srcdir/$_pkgbase-$pkgver
  make DESTDIR=$pkgdir install
  # symlink cracklib-small #34778
  #mkdir -p $pkgdir/usr/share/dict
  #ln -sf /usr/share/cracklib/cracklib-small $pkgdir/usr/share/dict/cracklib-small
  #sh ./util/cracklib-format dicts/cracklib-small \
  #  | sh ./util/cracklib-packer $pkgdir/usr/share/cracklib/pw_dict
  rm -rf "${pkgdir}/usr"/{include,bin,share}
}