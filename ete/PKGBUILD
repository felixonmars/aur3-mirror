# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=ete
pkgver=2.0rev89
pkgrel=1
pkgdesc='A python Environment for Tree Exploration.'
arch=('i686' 'x86_64')
url='http://ete.cgenomics.org/'
license=('GPL3')
depends=('python-numpy' 'pyqt' 'python-scipy' 'mysql-python')
source=("$url/releases/ete2/${pkgname}2-$pkgver.tar.gz")
md5sums=('39f1e76ba7c4a4ac51beeacae21a127d')

build() {
  cd ${pkgname}2-$pkgver

  python setup.py install --root="$pkgdir" --prefix=/usr || return 1
}
