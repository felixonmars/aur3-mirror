# Maintainer: Pieter Kokx <pieter@kokx.nl>
pkgname=gtkgrab-client
_pkgname=GtkGrab-client
pkgver=0.3.2
pkgrel=2
pkgdesc="Automatic screenshot upload utility"
arch=('any')
url="https://github.com/kokx/GtkGrab-client"
license=('GPL')
depends=('python2' 'xclip' 'scrot')
optdepends=(
    "zenity: For recording animated GIF's"
    "xrectsel: For recording animated GIF's"
    "byzanz: For recording animated GIF's"
)
options=(!emptydirs)
source=("https://github.com/kokx/$_pkgname/archive/v${pkgver}.tar.gz")
sha512sums=('653226d84551ef890cb7cde2c8864f99e3f8096fdf8281e0e52efe000f078784cf24444b81c6890aacc26c77a32bb19692e0e1bdd6d1126995d8866bb7142fcd')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

