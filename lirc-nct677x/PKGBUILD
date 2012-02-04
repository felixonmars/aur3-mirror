# Contributor: Andreas Schönfelder <passtschu at freenet dot de>

pkgname=lirc-nct677x
pkgver=1.0.4
pkgrel=5
_kernelver=2.6.35
_kernelname=ARCH
_lircver=0.8.6
_modulename=lirc_wb677
pkgdesc="lirc driver for Nuvoton NCT677x (ASROCK ION 330HT-BD)"
arch=(i686 x86_64)
url="http://www.asrock.com/nettop/overview.asp?Model=ION%20330HT-BD"
license=('GPL')
depends=('lirc' 'kernel26>=2.6.35' 'kernel26<2.6.36')
makedepends=('kernel26-headers>=2.6.35' 'kernel26-headers<2.6.36')
install=$pkgname.install
source=("http://europe.asrock.com/downloadsite/drivers/Nettop/Ubuntu/IR(9.10).zip"
        "http://prdownloads.sourceforge.net/lirc/lirc-$_lircver.tar.bz2"
        "http://repos.archlinux.org/wsvn/packages/lirc/repos/extra-i686/kernel-2.6.33.patch?op=dl"
        "http://repos.archlinux.org/wsvn/packages/lirc/repos/extra-i686/kernel-2.6.35.patch?op=dl")
md5sums=('e5a009da601583143912bc50b945eec5'
         '4ca24da6f5e7c2dcea74878c27a4a3f7'
         'f029698154cf32bc51e5e69879d53a12'
         'fdc37867570915123acc8daec03f7174')

build() {
  cd "$srcdir"

  # extract source
  ar x "$pkgname-src-$pkgver-ubuntu9.10.deb" || return 1
  tar -xf data.tar.gz || return 1
  ar x "$pkgname-$pkgver-ubuntu9.10.deb" || return 1
  tar -xf data.tar.gz || return 1

  # patching lirc
  cd "$srcdir/lirc-$_lircver"
  patch -Np0 -i "$srcdir/kernel-2.6.33.patch?op=dl" || return 1
  patch -Np0 -i "$srcdir/kernel-2.6.35.patch?op=dl" || return 1
  
  # build
  cd "$srcdir/usr/src/$pkgname-src-$pkgver-ubuntu9.10/$_modulename"
  sed -i "s|LIRC_DIR := .*|LIRC_DIR := $srcdir/lirc-$_lircver|" Makefile || return 1
  sed -i "s|/usr/src|$srcdir|g" lirc_wb677_common_extern.h || return 1
  ln -sf "$srcdir/lirc-$_lircver/drivers/" "$srcdir/lirc-$_lircver/drivers/lirc_dev/"
  make || return 1

  # install
  install -d "$pkgdir/etc/lirc" \
    "$pkgdir/usr/share/lirc/remotes/$_modulename" \
    "$pkgdir/lib/modules/$_kernelver-$_kernelname/kernel/drivers/misc"
  install -m644 "$srcdir/usr/share/$_modulename/lircrc_nuvoton" \
    "$pkgdir/etc/lirc/lircrc" || return 1
  install -m644 "$srcdir/usr/share/lirc/remotes/$_modulename/lircd.conf.wb677" \
    "$pkgdir/usr/share/lirc/remotes/$_modulename" || return 1
  install -m644 "$srcdir/usr/src/$pkgname-src-$pkgver-ubuntu9.10/$_modulename/$_modulename.ko" \
    "$pkgdir/lib/modules/$_kernelver-$_kernelname/kernel/drivers/misc" || return 1
}

# vim:set ts=2 sw=2 et:
