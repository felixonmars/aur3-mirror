# Contributor: Roberto Gea (Alquimista) <alquimistaotaku@gmail.com>

pkgname=scru
pkgver=1.1.1
pkgrel=2
pkgdesc="Screenshot Uploader"
arch=(any)
url="https://bitbucket.org/alquimista"
license=("MIT")
depends=("python2" "scrot" "plac" "pygobject")
makedepends=("python2-distribute")
source=(http://pypi.python.org/packages/source/S/Scru/${pkgname}-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('e7418017704a2d78a210480a576bd6ec') #generate with 'makepkg -g'


build() {

	cd $srcdir/${pkgname}
    python2 setup.py build
}

package() {
  cd $srcdir/${pkgname}
  python2 setup.py install --root=$pkgdir --optimize=1
}
