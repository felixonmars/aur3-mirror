# $Id: PKGBUILD 142408 2011-11-09 04:55:56Z tomegun $
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=udev-git
pkgver=20120107
pkgrel=1
pkgdesc="The userspace dev tools (udev)"
arch=('i686' 'x86_64')
url="http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html"
license=('GPL')
groups=('base')
options=('!makeflags' '!libtool')
depends=('util-linux' 'libusb-compat' 'glib2' 'module-init-tools' 'pciutils' 'kmod')
makedepends=('git' 'gobject-introspection' 'gperf' 'gtk-doc')
conflicts=('udev')
provides=('udev=999')
backup=('etc/udev/udev.conf')
source=('81-arch.rules')
md5sums=('3da2bb9891592f9438a07bd641465531')

_gitroot='git://git.kernel.org/pub/scm/linux/hotplug/udev.git'
_gitname='udev'

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure \
      --sysconfdir=/etc \
      --libexecdir=/lib \
      --sbindir=/sbin \
      --bindir=/sbin \
      --with-rootlibdir=/lib \
      --with-rootprefix=/ \
      --with-systemdsystemunitdir=/lib/systemd/system \
      --disable-rule-generator \
      --enable-udev_acl

  make
}

check() {
  make -C "$_gitname-build" check
}

package() {
  make -C "$_gitname-build" DESTDIR="$pkgdir" install

  # Install our rule for permissions and symlinks
  install -D -m644 "$srcdir/81-arch.rules" "$pkgdir/lib/udev/rules.d/81-arch.rules"

  # create framebuffer blacklist
  install -dm755 "$pkgdir/lib/modprobe.d"
  if pushd /lib/modules/ &>/dev/null; then
    for mod in */kernel/drivers/video/*fb.ko* */kernel/drivers/video/*/*fb.ko*; do
      mod=${mod%%.ko*}
      printf 'blacklist %s\n' "${mod##*/}"
    done | sort -u > "$pkgdir/lib/modprobe.d/framebuffer_blacklist.conf"
    popd &>/dev/null
  fi

  # /dev/loop0 is created for convenience, to autoload the module if necessary
  # may be obsoleted by https://lkml.org/lkml/2011/7/30/111
  install -dm755 "$pkgdir/lib/udev/devices"
  mknod -m 0660 "$pkgdir/lib/udev/devices/loop0" b 7 0
  chgrp disk "$pkgdir/lib/udev/devices/loop0"

  # Replace dialout/tape/cdrom group in rules with uucp/storage/optical group
  for i in "$pkgdir"/lib/udev/rules.d/*.rules; do
    sed -i 's#GROUP="dialout"#GROUP="uucp"#g;
            s#GROUP="tape"#GROUP="storage"#g;
            s#GROUP="cdrom"#GROUP="optical"#g' "$i"
  done
}

# vim: ft=sh syn=sh et
