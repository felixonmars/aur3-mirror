# Contributor: Sebastien Binet (binet@cern.ch)
# Contributor: Thomas Dziedzic

pkgname=python-yml2tex
pkgver=1.2
pkgrel=1
pkgdesc='yml2tex is a Python script which will generate a LaTeX Beamer presentation out of a YAML file.'
url='http://code.google.com/p/yml2tex'
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('python-yaml' 'pygments' 'texlive-core')
makedepends=('python-yaml' 'pygments' 'texlive-core')
source=("http://yml2tex.googlecode.com/files/yml2tex-$pkgver.tar.gz")
md5sums=('604b5943b6ef79007815ce07843de6e9')

build() {
  cd yml2tex-$pkgver

  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
