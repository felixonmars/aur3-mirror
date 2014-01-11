# Maintainer: Maximilien Noal <noal dot maximilien at gmail dot com> [AUR: xcomcmdr]
# $Id: PKGBUILD 92546 2013-06-08 00:40:57Z heftig $
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Charles Lindsay <charles@chaoslizard.org>

# package to avoid this:
# "missing 'vhba-module>=20130607' dependency for 'cdemu-daemon'"
# when one has cdemu-daemon working with linux-lts and vhba-module-lts
# (vhba-module-lts is from the AUR)

pkgname=cdemu-daemon-lts
_srcname=cdemu-daemon
pkgver=2.1.1
pkgrel=1
pkgdesc="CD/DVD-ROM device emulator daemon. For vhba-module-lts."
arch=(i686 x86_64)
url="http://cdemu.sourceforge.net/"
license=(GPL)
depends=(dbus "vhba-module-lts>=20130607" libao "libmirage>=2.1.0")
makedepends=(cmake)
provides=('cdemu-daemon')
conflicts=('cdemu-daemon')
optdepends=('alsa-lib: to enable the ALSA audio driver'
            'pulseaudio: to enable the PA audio driver')
backup=(etc/conf.d/cdemu-daemon
        etc/dbus-1/system.d/cdemu-daemon-dbus.conf)
install=cdemu-daemon.install
source=("http://downloads.sourceforge.net/cdemu/$_srcname-$pkgver.tar.bz2"
        system-arch.patch)
sha256sums=('d26782071184d555b06ad5def7d1c22916cbeb73377328879499b91e1196f36f'
            '29507da7367983bdc5f541e9f9252f189412041076842b8d08a5c4dac29f23cd')

prepare() {
  mkdir build
  cd $_srcname-$pkgver

  # Patch system daemon for Arch-friendlyness
  # It's disabled by default. Should we even ship it?
  patch -Np1 -i ../system-arch.patch
}

build() {
  cd build
  cmake ../$_srcname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/$_srcname
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/usr/lib/modules-load.d"
  echo vhba > "$pkgdir/usr/lib/modules-load.d/cdemu.conf"
}

# vim:set ts=2 sw=2 et:
