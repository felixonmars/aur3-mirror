# Maintainer: justmao945@gmail.com
# Previous maintainer: schuay <jakob.gruber@gmail.com>

pkgname=ranger-python2
_pkgname=ranger
pkgver=1.6.0
pkgrel=1
pkgdesc='A simple, vim-like file manager'
arch=('any')
url='http://ranger.nongnu.org'
license=('GPL')
depends=('python2>=2.6')
conflicts=('ranger-git' 'ranger' 'ranger-python2-git')
source=("http://ranger.nongnu.org/${_pkgname}-${pkgver}.tar.gz")

build() { 
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Replace "python" with the python binary you want ranger to use!
  # (python 2.6 and >=3.1 supported, below 2.6 will certainly not work.)
  python2 setup.py -q install --root="${pkgdir}" --optimize=1
}

md5sums=('6ff9aaf00f0ddafd4b0e2dbc9b634e23')
