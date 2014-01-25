# Maintainer: Andrew Grigorev <andrew@ei-grad.ru>

_pkgname=pycurl
pkgname=python3-${_pkgname}
pkgver=7.19.3
pkgrel=1
pkgdesc="Python 3.x interface to libcurl"
arch=('i686' 'x86_64')
url="http://pycurl.sourceforge.net/"
license=('LGPL' 'MIT')
depends=('python' 'curl' 'openssl')
options=(!emptydirs)
source=("http://pycurl.sourceforge.net/download/${_pkgname}-${pkgver}.tar.gz")
md5sums=('b9091b7438d3de1552e28862d2971cd1')

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python setup.py --with-ssl install --root="$pkgdir/" --optimize=1

  # rename the doc directory to avoid conflicts with python-pycurl package
  mv "${pkgdir}/usr/share/doc/pycurl"{,3}

}

# vim:set ts=2 sw=2 et:
