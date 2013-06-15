# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=gvfs
pkgname=lib32-$_pkgbase
pkgver=1.16.3
pkgrel=1
pkgdesc="Userspace virtual filesystem implemented as a pluggable module for gio (32 bit)"
arch=('x86_64')
license=('LGPL')
depends=('lib32-avahi' 'lib32-fuse' 'lib32-libarchive' 'lib32-libsoup'
         'lib32-udisks2' 'lib32-libsecret' 'lib32-libbluray' 'lib32-gtk3'
         'lib32-libcdio-paranoia' "$_pkgbase")
makedepends=('intltool' 'gcc-multilib'  'lib32-systemd')
url="http://www.gnome.org"
options=(!libtool)
install=gvfs.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgbase/1.16/$_pkgbase-$pkgver.tar.xz)
sha256sums=('02a4483d0dd2e307f58f8e1d34dd29dbe06d3a345b73ac8d6f87bb91189c8e49')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd $_pkgbase-$pkgver
  ./configure \
     --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
     --disable-static --libdir=/usr/lib32 --libexecdir=/usr/lib32/gvfs \
     --disable-bash-completion --disable-documentation \
     --disable-{nls,hal,gdu,goa,samba,afp,afc,libmtp,gphoto2,obexftp}
  make
}

package() {
  cd $_pkgbase-$pkgver
  sed -e 's/^am__append_4/#am__append_4/' \
      -e 's/^am__append_5/#am__append_5/' \
      -e 's/^am__append_6/#am__append_6/' \
      -e 's/^am__append_7/#am__append_7/' \
      -i monitor/Makefile
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/{bin,include,lib,share}
}

