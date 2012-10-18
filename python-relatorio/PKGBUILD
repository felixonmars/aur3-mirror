# Contributor: Florian Walch <florian.walch@gmx.at>
# Maintainer: Thomas Bahn <Thomas-Bahn@gmx.net>
pkgname=python-relatorio
pkgver=0.5.6
pkgrel=2
pkgdesc="A templating library able to output odt and pdf files"
arch=('i686' 'x86_64')
url="http://relatorio.openhex.org"
license=('GPL')
depends=('python2-genshi>=0.5' 'python-lxml>=1.3.6')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/r/relatorio/relatorio-$pkgver.tar.gz")

build() {
  cd $srcdir/relatorio-$pkgver
  chmod 644 relatorio.egg-info/*
  python2 setup.py install --root=$pkgdir
}


md5sums=('944fb60fadaff451ab6ee8818de516ad')
