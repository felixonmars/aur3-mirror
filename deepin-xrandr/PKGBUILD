# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=deepin-xrandr
pkgver=git20130417113459
_realver=0.1+${pkgver}
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.linuxdeepin.com/"
license=('GPL3')
pkgdesc="deepin gsettings python2 bindings from git"
depends=('python2' 'libxrandr')
makedepends=('python2-setuptools' 'intltool')
source=("http://packages.linuxdeepin.com/deepin/pool/main/d/${pkgname}/${pkgname}_${_realver}.tar.gz")
sha256sums=('fab5c56c55768fd040691cd33cbd2bc2d526904950bd01fdd53679468fc09eb3')

prepare() {
  cd $srcdir/${pkgname}-${_realver}

  # fix python version
  find -iname "*.py" | xargs sed -i 's=\(^#! */usr/bin.*\)python=\1python2='
}

package() {
  cd $srcdir/${pkgname}-${_realver}
  python2 setup.py install --root=$pkgdir
}
