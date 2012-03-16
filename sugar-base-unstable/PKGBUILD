# Maintainer: Xin Wang <dram.wang@gmail.com>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Christophe Gueret <christophe.gueret@gmail.com>

pkgname=sugar-base-unstable
_realname=${pkgname%-unstable}
pkgver=0.95.2
pkgrel=2
pkgdesc="Helpers for the development of services and activities in Sugar"
arch=('i686' 'x86_64')
url="http://www.sugarlabs.org/"
license=('GPL')
groups=('sugar-desktop' 'glucose')
conflicts=('sugar-base')
depends=('python2' 'pygtk' 'python2-gobject2' 'python2-decorator' 'python-cjson' 'pygtksourceview2')
makedepends=('intltool>=0.33' 'perl>=5.8.1' 'pkg-config' 'pygobject2-devel')
optdepends=('ipython: Nicer traceback')
source=(http://download.sugarlabs.org/sources/sucrose/glucose/${_realname}/${_realname}-${pkgver}.tar.bz2)
md5sums=('aa5dedfd8889a739a211086051c7f96a')
options=('!libtool')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  PYTHON=python2 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

