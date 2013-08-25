# Contributor: Zubkov Alexander <green@msu.ru>

_pkgname=zfs
pkgname=zfs-linux-git
pkgver=0.6.2
pkgrel=1
pkgdesc="Kernel modules for the Zettabyte File System (git-version)"
arch=('i686' 'x86_64')
url="http://zfsonlinux.org/"
license=('CDDL')
depends=("spl=0.6.2_3.10.9-1" "zfs-utils=0.6.2_3.10.9-1" "linux=3.10.9-1")
makedepends=('git' "linux-headers=3.10.9")
conflicts=('zfs')
provides=('zfs')
install=zfs-git.install
source=(git://github.com/zfsonlinux/zfs)
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g' -e 's|zfs.||'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libdir=/usr/lib \
              --datadir=/usr/share \
              --includedir=/usr/include \
              --with-udevdir=/lib/udev \
              --libexecdir=/usr/lib/zfs-0.6.2 \
              --with-config=kernel
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install

  # move module tree /lib -> /usr/lib
  cp -r $pkgdir/{lib,usr}
  rm -r $pkgdir/lib
}
