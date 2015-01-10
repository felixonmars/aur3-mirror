# Contributor: WAntilles <wantilles@adslgr.com>
# Maintainer: martadinata666 <martadinata666@gmail.com>

pkgname=compiz-fusion-plugins-unsupported
pkgver=0.8.10
pkgrel=1
pkgdesc="Compiz Fusion Unsupported plugins,provide effects like snow and fish"
arch=('i686' 'x86_64')
url="http://blog.northfield.ws/compiz-0-8-10-release-announcement/"
license=('GPL')
depends=("compiz-core>=${pkgver}" "compiz-bcop>=${pkgver}" "compiz-fusion-plugins-main>=${pkgver}" 'libnotify' 'mesa')
makedepends=('intltool' 'pkgconfig' 'gettext')
conflicts=('compiz-fusion-plugins-unsupported-git')
source=(http://www.northfield.ws/projects/compiz/releases/${pkgver}/plugins-unsupported.tar.gz)
md5sums=('a7391dfbc4f83546e866d84e6457555e')
options=(!libtool)

build() {
  cd ${srcdir}/plugins-unsupported
  ./autogen.sh --prefix=/usr
  make
}

package()
{
  cd "${srcdir}/plugins-unsupported"
  make DESTDIR=${pkgdir} install
}
