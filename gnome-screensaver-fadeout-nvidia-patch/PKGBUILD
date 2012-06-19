# $Id: PKGBUILD 156838 2012-04-23 09:07:17Z ibiru $
# Maintainer: aji <ajiproduction gmail com>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=gnome-screensaver
pkgname=gnome-screensaver-fadeout-nvidia-patch
pkgver=3.4.1
pkgrel=1
pkgdesc="Screensaver designed to integrate well with the GNOME desktop."
arch=('i686' 'x86_64')
license=('GPL')
url="http://live.gnome.org/GnomeScreensaver"
backup=(etc/pam.d/gnome-screensaver)
depends=('dbus-glib' 'libgnomekbd' 'gnome-desktop' 'gsettings-desktop-schemas' 'libsystemd')
makedepends=('pkgconfig' 'intltool' 'libxss')
groups=('gnome')
options=(!emptydirs)
provides=("gnome-screensaver")
install=gnome-screensaver.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz
       gnome-screensaver.pam
       fadeout-with-nvidia.patch)
sha256sums=('d54a253f826ff6cd48eba53724339896a6dea39029848b6a8d5972c8e162069b'
            'c19870c4f2d6e91ba0eea2603753a74e0c5c82ff5fa3cacb1198027a38d0a6cb'
            '847a55736bc8231bc3dc5ea2a01a3d8d7a543a389841906cd95530554e65f0cf')

build() {
  #cd $_pkgname-$pkgver
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/fadeout-with-nvidia.patch"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/gnome-screensaver \
      --localstatedir=/var \
      --with-mit-ext --with-systemd

  make
}

package() {
  #cd $_pkgname-$pkgver
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/gnome-screensaver.pam" "${pkgdir}/etc/pam.d/gnome-screensaver"
}
