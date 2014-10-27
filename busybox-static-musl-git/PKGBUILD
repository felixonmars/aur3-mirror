# Maintainer: Jens Staal <staal1978@gmail.com>

_gitname=busybox
pkgname=$_gitname-static-musl-git
pkgver=20141005.13497
pkgrel=2
pkgdesc="Combines common UNIX utilities into a single small executable, statically linked with musl libc"
arch=('i686' 'x86_64')
url="http://wiki.musl-libc.org/wiki/Building_Busybox"
license=('GPL')
provides=("$_gitname")
conflicts=("$_gitname")
makedepends=('git' 'musl' 'kernel-headers-musl-git')
source=(git://git.busybox.net/"$_gitname" "ifplugd.patch")
md5sums=("SKIP" "SKIP")

pkgver() {
  cd   "$srcdir"/"$_gitname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  rm -rf $srcdir/build
  mkdir -p $srcdir/build
 
  cd $srcdir/$_gitname
  make O=$srcdir/build allyesconfig
  
  patch -p1 -i$srcdir/ifplugd.patch
  
  cd $srcdir/build
  #adjust config by sed - in -git a patch can quickly be obsolete
  sed 's|CONFIG_EXTRA_COMPAT|# CONFIG_EXTRA_COMPAT is not set|g' -i .config
  sed 's|CONFIG_SELINUX|# CONFIG_SELINUX is not set|g' -i .config
  sed 's|CONFIG_FEATURE_HAVE_RPC|# CONFIG_FEATURE_HAVE_RPC is not set|g' -i .config
  sed 's|CONFIG_WERROR|# CONFIG_WERROR is not set|g' -i .config
  sed 's|CONFIG_FEATURE_SYSTEMD|# CONFIG_FEATURE_SYSTEMD is not set|g' -i .config
  sed 's|CONFIG_FEATURE_VI_REGEX_SEARCH|# CONFIG_FEATURE_VI_REGEX_SEARCH is not set|g' -i .config
  sed 's|CONFIG_PAM|# CONFIG_PAM is not set|g' -i .config
  sed 's|CONFIG_SELINUXENABLED|# CONFIG_SELINUXENABLED is not set|g' -i .config
  sed 's|CONFIG_FEATURE_MOUNT_NFS|# CONFIG_FEATURE_MOUNT_NFS is not set|g' -i .config
  
  #extra stuff to disable until a patch has been found
  # missing rpc/rpc.h
  sed 's|CONFIG_INETD|# CONFIG_INETD is not set|g' -i .config
  
  make CC=musl-gcc CFLAGS='-Os -static' 
}

package() {
 mkdir   -p    $pkgdir/usr/bin
 install -m755 $srcdir/build/busybox $pkgdir/usr/bin/
}