# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=udisks2
pkgname=lib32-${_pkgbase}
pkgver=2.1.0
pkgrel=1
pkgdesc="Disk Management Service, version 2 (32 bit)"
arch=('x86_64')
url="http://www.freedesktop.org/wiki/Software/udisks"
license=('GPL2')
depends=('lib32-glib2')
makedepends=('intltool' 'gobject-introspection' 'gcc-multilib' 'lib32-systemd' 'lib32-libatasmart' 'lib32-polkit' 'lib32-acl' "${_pkgbase}")
options=(!libtool)
source=(http://udisks.freedesktop.org/releases/udisks-$pkgver.tar.bz2)
sha256sums=('310208e5a10335dae4b52a0125c24d31cf292cce3d15cf65da4cd308e38d15a8')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd udisks-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --with-systemdsystemunitdir=/usr/lib/systemd/system \
      --localstatedir=/var --disable-static --disable-man \
      --disable-gtk-doc --disable-nls --libdir=/usr/lib32
  make
}

package() {
  make -C udisks-$pkgver DESTDIR="$pkgdir" install \
    bash_completiondir=/usr/share/bash-completion/completions
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,lib,sbin,share},var}
}
