# $Id: PKGBUILD 15082 2008-10-12 14:43:10Z jgc $
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>

pkgname=netspeed-applet-fontsize
pkgver=0.15.2
pkgrel=1
pkgdesc="GNOME applet that shows how much traffic occurs on a specified network device (supporting font size modification)."
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/projects/netspeed/"
depends=('gnome-panel>=2.24.0' 'libgtop>=2.24.0' 'wireless_tools')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.14.0')
provides=('netspeed-applet')
conflicts=('netspeed-applet')
install=netspeed-applet.install
source=(http://www.wh-hms.uni-ulm.de/~mfcn/shared/netspeed/netspeed_applet-${pkgver}.tar.gz fontsize.patch)
md5sums=('5989bb70aec6645409b0e300539caa4b'
         '44fcca700dccd762cfae9f04d935269e')

build() {
  cd "${srcdir}/netspeed_applet-${pkgver}"
  patch -p1 < ${startdir}/src/fontsize.patch || exit 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/netspeed-applet \
              --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install
}
