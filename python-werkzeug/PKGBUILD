# Maintainer: Dan Serban
# Contributor: Richard Murri

pkgname=python-werkzeug
pkgver=0.x.x.latest
pkgrel=1
pkgdesc="The Swiss Army knife of Python web development"
arch=(any)
url=http://werkzeug.pocoo.org/
license=(BSD)
depends=(python2)
makedepends=(lynx setuptools)

build()
{
  rm Werkzeug.tar.gz 2>/dev/null || true
  _url=$(lynx -dump http://pypi.python.org/pypi/Werkzeug/ | grep -o http.*tar.gz | head -1)
  wget -O Werkzeug.tar.gz "${_url}"
  bsdtar -xf Werkzeug.tar.gz
  cd $(ls -1d Werkzeug-*/ | tail -1)
  python2 setup.py install --root="${pkgdir}" --prefix=/usr
}

