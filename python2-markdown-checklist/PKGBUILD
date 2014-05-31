# Maintainer: <clu@eeviac>

pkgname=python2-markdown-checklist
_pkgname=markdown-checklist
pkgver=0.4.0
pkgrel=1
epoch=
pkgdesc="Python Markdown extension for lists of tasks with checkboxes"
arch=('i686' 'x86_64')
url="https://github.com/FND/markdown-checklist"
license=('MIT')
groups=()
depends=(python2-markdown)
makedepends=(python2-setuptools)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(https://github.com/FND/$_pkgname/archive/v$pkgver.tar.gz
        .AURINFO)
md5sums=('24f7f328e891453eb83f31c4d0a15289'
         'd41d8cd98f00b204e9800998ecf8427e')
noextract=()


package() {
  cd $_pkgname-$pkgver

  python2 setup.py install --root=$pkgdir --prefix=/usr --optimize=1
}
