# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
# Contributor: Kyle Fuller <inbox at kylefuller dot co dot uk>

pkgname="zfs-utils-therp-git"
pkgver=0.6.2_r162.g3566d5c
pkgrel=1
_pkgver=${pkgver/_*/}
pkgdesc="Kernel module support files for the Zettabyte File System."
depends=("spl-utils-therp-git")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=(git://github.com/zfsonlinux/zfs.git
        zfs-utils.bash-completion
        zfs-utils.initcpio.install
        zfs-utils.initcpio.hook
        zfs-utils.service)
groups=("archzfs")
license=("CDDL")
conflicts=("zfs-utils-therp")

pkgver() {
  cd "$srcdir/zfs"
  git describe --long | sed -E 's/-([^-]*-g)/_r\1/;s/-/./g;s/zfs\.//'
}

build() {
  cd "$srcdir/zfs"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --sbindir=/usr/bin \
              --libdir=/usr/lib \
              --datadir=/usr/share \
              --includedir=/usr/include \
              --with-udevdir=/lib/udev \
              --libexecdir=/usr/lib/zfs-${pkgver} \
              --with-config=user
  make
}

package() {
  cd "$srcdir/zfs"
  make DESTDIR="$pkgdir" install

  # Remove uneeded files
  rm -r $pkgdir/etc/init.d
  rm -r $pkgdir/usr/lib/dracut

  # move module tree /lib -> /usr/lib
  cp -r $pkgdir/{lib,usr}
  rm -r $pkgdir/lib

  # Fixup path
  mv $pkgdir/sbin/mount.zfs $pkgdir/usr/bin/
  rm -r $pkgdir/sbin

  install -D -m644 $srcdir/zfs-utils.initcpio.hook $pkgdir/usr/lib/initcpio/hooks/zfs
  install -D -m644 $srcdir/zfs-utils.initcpio.install $pkgdir/usr/lib/initcpio/install/zfs
  install -D -m644 $srcdir/zfs-utils.service $pkgdir/usr/lib/systemd/system/zfs.service
  install -D -m644 $srcdir/zfs-utils.bash-completion $pkgdir/usr/share/bash-completion/completions/zfs
}
md5sums=('SKIP'
         '3e1c4a29c4f7d590e6a3041f2c61d6ff'
         'ebea2b1e593a9a19efa0f7ae7451bbc7'
         '8eec7f96316c7a1b6eeda8d56266a935'
         '2dd798467cfe03aa4532399b86d76300')
