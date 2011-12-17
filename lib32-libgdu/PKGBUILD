# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=gnome-disk-utility
pkgname=lib32-libgdu
pkgver=3.0.2
pkgrel=1
pkgdesc="GNOME libraries and applications for dealing with storage devices (32 bit library)"
arch=('x86_64')
license=('GPL')
url="http://www.gnome.org"
depends=('lib32-libunique3' 'lib32-dbus-glib' 'lib32-libgnome-keyring'  'lib32-gtk3')
makedepends=('udisks' 'lib32-libatasmart' 'lib32-libnotify' 'lib32-avahi' 'gtk-doc' 'intltool' 'gcc-multilib')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.xz
       fix-freeze.patch)
sha256sums=('7983f12ba04e84f164d0cae54bb06ed9b3ebe6c0a1c606d63d067fc395aeb0a5'
            '818b70360978968457d2c50738347c6726ed8d0c007eb57074881a7e33652526')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  patch -Np1 -i "${srcdir}/fix-freeze.patch"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib32/gnome-disk-utility \
      --disable-scrollkeeper --disable-nautilus --disable-static \
      --libdir=/usr/lib32
      
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Remove stuff from gnome-disk-utility and non-lib32 stuff from libgdu
  rm -rf ${pkgdir}/etc/
  rm -rf ${pkgdir}/usr/{bin,include,share}
  rm -rf ${pkgdir}/usr/lib32/libgdu-gtk*
  rm -rf ${pkgdir}/usr/lib32/gnome-disk-utility
  rm -rf ${pkgdir}/usr/lib32/pkgconfig/gdu-gtk.pc
}
