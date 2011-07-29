# Maintainer: Igor Borges <igorborges12@gmail.com>
pkgname=pyaxelws
pkgver=1.0.2
pkgrel=1
pkgdesc="An extended version of pyaxel, a CLI based download accelerator in Python."
arch=('any')
url="http://code.google.com/p/pyaxelws/"
license=('GPL3')
install=pyaxelws.install
source=('daemon')
depends=('python2')
makedepends=('mercurial')
md5sums=('8217a72477ee6a89f85fda54345801cf')

build() {
  cd "${srcdir}"
  hg clone "https://code.google.com/p/pyaxelws/" ${pkgname}
  cd "${srcdir}/${pkgname}"
  # python 2 fix
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' pyaxelws.py
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "${pkgdir}/usr/"{share/${pkgname},bin}
  install -Dm644 pyaxelws.py StateManager.py ThreadPool.py "${pkgdir}/usr/share/${pkgname}"
  install -Dm755 ${srcdir}/daemon "${pkgdir}/etc/rc.d/${pkgname}"
  ln -s "${pkgdir}/usr/share/${pkgname}/pyaxelws.py" "${pkgdir}/usr/bin/${pkgname}"
}
