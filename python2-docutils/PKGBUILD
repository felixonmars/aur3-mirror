# Maintainer: Eugene Nikolsky <pluton dot od at gmail dot com>

_pkgname=docutils
pkgname=python2-${_pkgname}
pkgver=0.8.1
pkgrel=1
pkgdesc="Open-source text processing system for processing plaintext documentation into useful formats, such as HTML, LaTeX, man-pages, open-document or XML."
arch=('any')
url="http://docutils.sourceforge.net"
license=('custom')
depends=('python2')
source=(http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-$pkgver.tar.gz)
md5sums=('2ecf8ba3ece1be1ed666150a80c838c8')

check() {
  cd ${srcdir}/${_pkgname}-${pkgver}/test
  python2 alltests.py
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  sed -i -e '1s|#! \?/usr/bin/python$|#!/usr/bin/python2|' \
         -e '1s|#! \?/usr/bin/env python$|#!/usr/bin/env python2|' \
    $(find . -name '*.py')

  python2 setup.py install --root=${pkgdir} --optimize=1

  for f in ${pkgdir}/usr/bin/*.py; do
      ln -s $(basename $f) $pkgdir/usr/bin/$(basename $f .py)
  done

  install -D -m644 COPYING.txt ${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt
  install -D -m644 licenses/*.txt ${pkgdir}/usr/share/licenses/${pkgname}/
}

