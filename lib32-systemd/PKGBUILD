# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=systemd
pkgname=lib32-${_pkgbase}
pkgver=197
pkgrel=1
pkgdesc="system and service manager (32bit)"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/systemd"
license=('GPL2' 'LGPL2.1' 'MIT')
depends=('lib32-pam' 'lib32-lzma' 'lib32-libgcrypt' 'lib32-glib2' 'lib32-libcap' "${_pkgbase}")
makedepends=('lib32-acl' 'lib32-dbus-core' 'hwids' 'lib32-util-linux' 'lib32-kmod' 'gobject-introspection' 'gperf' 'intltool' 'linux-api-headers' 'quota-tools' 'gcc-multilib' 'lib32-libmicrohttpd') # 'cryptsetup' 'python'
provides=("lib32-libsystemd=$pkgver" "lib32-systemd-tools=$pkgver" "lib32-udev=$pkgver")
conflicts=('lib32-libsystemd' 'lib32-systemd-tools' 'lib32-udev')
options=('!libtool')
source=("http://www.freedesktop.org/software/$_pkgbase/$_pkgbase-$pkgver.tar.xz"
        '0001-dbus-fix-serialization-of-calendar-timers.patch')
md5sums=('56a860dceadfafe59f40141eb5223743'
         'da0b969955e1bab0e73b38cf0f7a0a1c')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd ${_pkgbase}-${pkgver}
 
  # fix assertion failure when using calendar timers
  # upstream 3761902e2e120849c283106fd4b78b6adec7367e
  patch -Np1 <"$srcdir/0001-dbus-fix-serialization-of-calendar-timers.patch"

  ./configure \
      --libdir=/usr/lib32 \
      --libexecdir=/usr/lib32 \
      --localstatedir=/var \
      --sysconfdir=/etc \
      --enable-introspection \
      --disable-audit \
      --disable-gtk-doc \
      --disable-ima \
      --disable-libcryptsetup \
      --disable-manpages \
      --disable-nls \
      --disable-qrencode \
      --disable-selinux \
      --disable-tcpwrap \
      --with-sysvinit-path= \
      --with-sysvrcnd-path= \
      --without-python

  make
}

package() {
  make -C $_pkgbase-$pkgver DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/{etc,var,usr/{bin,include,lib,share}}
}
