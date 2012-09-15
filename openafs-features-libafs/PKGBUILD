# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=openafs-features-libafs
pkgver=1.7.17
pkgrel=1
pkgdesc="OpenAFS libafs kernel module for modular Features package"
arch=('i686' 'x86_64')
url="http://www.openafs.org/"
license=('custom')
depends=('openafs-features')
makedepends=('linux-headers')
install=openafs.install
source=(http://www.openafs.org/dl/openafs/$pkgver/openafs-$pkgver-src.tar.bz2 \
        fix-linux-3.5.patch)
md5sums=('dd5e17aa5e2b682c533867cf24abf0e4'
         '56f4177d510235bed8f9ac2375305b94')

_kernver=`uname -r`
_extramodules=`readlink -fn /usr/lib/modules/$_kernver/extramodules`

build() {
  cd "$srcdir/openafs-$pkgver"

  # See http://gerrit.openafs.org/7578 for more information
  # contains some other fixes needed to make it compile
  patch -Np1 < ${srcdir}/fix-linux-3.5.patch || true

  ./regen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/openafs \
    --with-linux-kernel-packaging --disable-fuse-client
  make only_libafs
}

package() {
  cd "$srcdir/openafs-$pkgver"

  make DESTDIR="$pkgdir/" install_only_libafs

  # remove rendundant directories
  rm -rf "$pkgdir"/usr

  # move modules to a proper place
  install -D -m755 "$pkgdir"/lib/modules/*/extra/openafs/openafs.ko \
    "$pkgdir/$_extramodules/libafs.ko"
  gzip -9 "$pkgdir/$_extramodules/libafs.ko"
  rm -rf "$pkgdir"/lib

  # install license
  install -D -m644 src/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
