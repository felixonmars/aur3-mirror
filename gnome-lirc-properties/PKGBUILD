# Contributor: dottorblaster <dottorblaster@gmail.com>

pkgname=gnome-lirc-properties
pkgver=0.5.1
pkgrel=3
pkgdesc="This control panel can detect your IR receiver and suggest a remote control, making configuration of lirc easy."
arch=('i686' 'x86_64')
depends=('lirc' 'pygtk' 'polkit')
makedepends=('intltool' 'gnome-doc-utils')
url="http://live.gnome.org/gnome-lirc-properties"
source=("http://ftp.gnome.org/pub/gnome/sources/gnome-lirc-properties/0.5/$pkgname-$pkgver.tar.bz2")
license=('GPL2')
md5sums=('a732d41e55bc0490bc0a68142f7cb18f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
