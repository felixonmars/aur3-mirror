# Maintainer: Mark <mark@caffeine-powered.net>
# This pkgbuild is a modified xen4 pkgbuild. Most credits go to that maintainer.

pkgname=xen4-hg
pkgver=21285
pkgrel=1
pkgdesc="Xen 4 (hypervisor tools and doc) HG"
arch=(i686 x86_64)
url="http://xen.org/"
license="GPL"
depends=('xz-utils' 'bzip2' 'lib32-glibc-devel' 'transfig' 'texlive-core' 'iproute' 'bridge-utils' 'python' 'sdl' 'zlib' 'e2fsprogs' 'bin86' 'pkgconfig' 'iasl' 'gnutls')
makedepends=('dev86' 'mercurial' 'git' 'ghostscript')
conflicts=('xen' 'xen3' 'xen4' 'xen-hv-tools' 'libxen4')
provides=('xen')
source=(xen.patch)
md5sums=('04d7bb8196ec814fe4025f205da88d67')
_hgroot="http://xenbits.xen.org/xen-4.0-testing.hg"
_hgrepo="xen-4.0-testing"

build() {

  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo || return 1
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -r "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  patch -p1 -i ../xen.patch
  
  find ../     -name Makefile -o -name Rules.mk -o -name Config.mk -exec sed \
			-e 's/CFLAGS\(.*\)=\(.*\)-O3\(.*\)/CFLAGS\1=\2\3/' \
			-e 's/CFLAGS\(.*\)=\(.*\)-march=i686\(.*\)/CFLAGS\1=\2\3/' \
			-e 's/CFLAGS\(.*\)=\(.*\)-fomit-frame-pointer\(.*\)/CFLAGS\1=\2\3/' \
			-e 's/CFLAGS\(.*\)=\(.*\)-g3*\s\(.*\)/CFLAGS\1=\2 \3/' \
			-e 's/CFLAGS\(.*\)=\(.*\)-O2\(.*\)/CFLAGS\1=\2\3/' \
			-i {} \;
 	
 
  unset LDFLAGS
  make -C tools || return 1
  make dist-xen || return 1
  #LDFLAGS="-L/usr/lib/ -L$srcdir/xen-${pkgver}/dist/install/usr/lib -L$srcdir/xen-${pkgver}/dist/install/usr/lib64" make dist-tools || return 1
  LDFLAGS="-L/usr/lib/ -L$srcdir/$_hgrepo-build/dist/install/usr/lib -L$srcdir/$_hgrepo-build/dist/install/usr/lib64" make dist-tools || return 1
  make dist-docs || return 1

  cp -R dist/install/* $pkgdir
  
  sed -i 's#XENDOM_CONFIG=/etc/sysconfig/xendomains#XENDOM_CONFIG=/etc/conf.d/xendomains#' $pkgdir/etc/init.d/xendomains
  sed -i "s#touch /var/lock/subsys/xend#mkdir -p /var/lock/subsys\n	touch /var/lock/subsys/xend#" $pkgdir/etc/init.d/xend

  [ -x "$(which udevadm)" ] && UDEV_VERSION=$(udevadm -V | sed -e 's/^[^0-9]* \([0-9]\{1,\}\)[^0-9]\{0,\}/\1/')

  if [ -n "$UDEV_VERSION" ] && [ $UDEV_VERSION -ge 059 ]; then
    echo " - installing for udev-based system"
    rm -rf "$pkgdir/etc/hotplug"
  else
    echo " - installing for hotplug-based system"
    rm -rf "$pkgdir/etc/udev"
  fi

  [ -d $pkgdir/usr/lib64 ] && ( cd $pkgdir/usr && cp -R lib64/* lib/ && rm -R lib64 )
  ( cd $pkgdir/etc && mv init.d rc.d ) || return 1
  ( cd $pkgdir/etc && mv sysconfig conf.d ) || return 1
  rm -f $pkgdir/usr/share/man/man1/qemu-img.1* \
       $pkgdir/usr/share/man/man1/qemu.1*
 
  
}
