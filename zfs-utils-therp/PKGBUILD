# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
# Contributor: Kyle Fuller <inbox at kylefuller dot co dot uk>

pkgname=("zfs-utils-therp")
pkgver=0.6.3_1.2
github_pkg=zfs-${pkgver/_/-}
pkgrel=1
pkgdesc="Kernel module support files for the Zettabyte File System."
depends=("spl-utils-therp=${pkgver}-${pkgrel}")
arch=("i686" "x86_64")
url="http://zfsonlinux.org/"
source=(https://github.com/zfsonlinux/zfs/archive/${github_pkg}.tar.gz
        zfs-utils.bash-completion-r1
        zfs-utils.initcpio.install
        zfs-utils.initcpio.hook
        zfs-utils.service)
groups=("archzfs")
license=("CDDL")

build() {
  cd "$srcdir/zfs-${github_pkg}"
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
  cd "$srcdir/zfs-${github_pkg}"
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
  install -D -m644 $srcdir/zfs-utils.bash-completion-r1 $pkgdir/usr/share/bash-completion/completions/zfs
}

md5sums=('67d6b60cdac7857e5475778ebc19e167'
         '9ddb0c8a94861f929d0fa741fdc49950'
         'd36549e6e04d817051d50c3636f21132'
         'ffa2220e660198eaf404daa937394973'
         '2dd798467cfe03aa4532399b86d76300')
