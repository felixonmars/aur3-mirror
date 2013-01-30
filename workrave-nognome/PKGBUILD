# Maintainer: <kfgz at interia dot pl>

pkgname=workrave-nognome
pkgver=1.10
pkgrel=1
pkgdesc="a tool to help RSI"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://workrave.org"
depends=('gnet' 'dbus' 'libxmu' 'gdome2' 'libsigc++' 'libxtst' 'python-cheetah')
makedepends=('intltool')
conflicts=('workrave')
options=(!emptydirs)
source=(workrave-${pkgver}.tar.gz::http://sourceforge.net/projects/workrave/files/workrave/${pkgver}/workrave-${pkgver}.tar.gz/download)
md5sums=('5b76c2ef8e1dfede69c4e0d4bca9dcb9')

build() {
  cd "${srcdir}"/workrave-${pkgver}
  export PYTHON=python2
  ./configure --prefix=/usr --enable-dbus --sysconfdir=/etc --libexecdir=/usr/lib/workrave \
  --disable-pulse  --disable-gconf --disable-gnome
  make
}

package() {
  cd "${srcdir}"/workrave-${pkgver}
  make DESTDIR="${pkgdir}" install
  sed -i "s|workrave-sheep|/usr/share/icons/hicolor/scalable/apps/workrave-sheep.svg|g" \
  "${pkgdir}"/usr/share/applications/workrave.desktop
}
