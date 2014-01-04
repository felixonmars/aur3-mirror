# Maintainer: Mark LaDoux <mark.ladoux at gmail.com>

pkgname=gvfs-rar
_majorver=1.19
pkgver=1.19.3
pkgrel=1
pkgdesc="GVFS virtual filesystem (with rar archive support)"
arch=(i686 x86_64)
license=('LGPL')
depends=('libsoup>=2.24.2.1' 'libcdio>=0.80-3' 'fuse>=2.7.4' 'bluez-libs' 'smbclient>=3.2.4' 'libgphoto2>=2.4.3' 'gnome-keyring>=2.24.1' 'avahi>=0.6.23' 'libarchive>=2.5.5' 'unrar' 'python' 'glib2>=2.20')
provides=('gvfs=1.19.2')
conflicts=('gvfs')
replaces=('gvfs=${pkgver}')
makedepends=('pkgconfig' 'intltool' 'autoconf' 'automake')
url="http://www.gnome.org"
install=gvfs.install
options=(!libtool)
source=(http://ftp.gnome.org/pub/gnome/sources/gvfs/${_majorver}/gvfs-${pkgver}.tar.xz gvfs.install nautilus-mount-rar.desktop rarfs.patch)
sha256sums=('06a78162abdf2618c3676b9d44c55443c1b19d066552d52d54bc92f93d695c4a'
            'df945effa201c98fa433158e4131330057ecc1a1b277d0499bd30c207b6536a4'
            'a933000de4d7d3506ff39a592cf745e9d9c03eb21fd7513ccaec7e5a79b51826'
            '12fad44749952b3b5421cecc13b540bfea6de71cb249327951848922650336a9')

build() {
  cd "${srcdir}/gvfs-${pkgver}"

  patch -Np1 -i ${startdir}/rarfs.patch || return 1

  autoreconf -i

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
            --libexecdir=/usr/lib/gvfs || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -m755 -d ${pkgdir}/usr/share/applications || return 1
  install -m644 ${startdir}/nautilus-mount-rar.desktop ${pkgdir}/usr/share/applications || return 1
}
