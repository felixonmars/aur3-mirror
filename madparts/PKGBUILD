# Maintainer: Matthias Blaicher <matthias[at]blaicher[dot]com>
pkgname=madparts
pkgver=1.2
pkgrel=4
pkgdesc="A functional PCB footprint editor"
url="http://madparts.org/"
arch=('any')
license=('GPLv3')
depends=('python2>=2.7' 'python2-numpy>=1.6.2' 'python2-pyside>=1.1.1'
         'python2-opengl>=3.0.2' 'python2-beautifulsoup4>=4.1.0'
         'python2-imaging')
optdepends=()
makedepends=()
conflicts=('madparts-git')
replaces=()
backup=()
install=''
source=("${pkgname}-${pkgver}.zip::https://github.com/andete/madparts/archive/v${pkgver}.zip")
md5sums=('db8ccd1ffc937de97a9ab4f47b449a8c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # python2 fix
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' madparts
  
  python2 setup.py install --root=$pkgdir
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
