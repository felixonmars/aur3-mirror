pkgname=simple-lightdm-manager
pkgver=0.2
pkgrel=3
pkgdesc="An application to customize LightDM"
arch=('i686' 'x86_64')
url="https://launchpad.net/~claudiocn"
license=('GPL3' 'LGPL3')
source=("https://launchpadlibrarian.net/81977867/${pkgname}_${pkgver}-public7.tar.gz")
depends=('gksu' 'lightdm' 'python-distutils-extra' 'pygtk')
optdepends=()
makedepends=()
backup=()

build() {
  cd $srcdir/$pkgname
     python2 setup.py install --root=$pkgdir
}

md5sums=('ba4abb4d194e98a1a3e1416ac9ffc7ea')
