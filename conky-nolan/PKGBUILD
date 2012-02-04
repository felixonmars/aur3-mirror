# Maintainer: Bartek Piotrowski <barthalion@gmail.com>

pkgname=conky-nolan
_pkgname=conky
pkgver=1.8.1
pkgrel=1
pkgdesc='An advanced, highly configurable system monitor for X based on torsmo without wireless support'
arch=('i686' 'x86_64')
url='http://conky.sourceforge.net/'
license=('GPL')
depends=('alsa-lib' 'libxml2' 'curl' 'libxft' 'glib2' 'libxdamage' 'imlib2')
makedepends=('pkgconfig')
replaces=('torsmo')
provides=('conky=$pkgver')
conflicts=('conky')
backup=('etc/conky/conky.conf' 'etc/conky/conky_no_x11.conf')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz")
       #current-power.patch)
md5sums=('9b330f7d001cbd9f818e485defc19029')
        #'9bb3f8f5e2d040f00e493e35450c3da2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
#  patch -p0 < ../current-power.patch # See FS#21984

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-rss \
              --enable-ibm \
              --enable-imlib2 \
              --disable-lua \
              --disable-wlan \

  make
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
