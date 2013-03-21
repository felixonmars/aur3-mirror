# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
pypkgletter=d
pypkgname=django-mbtiles
pkgname=python2-$pypkgname
pkgver=1.0
pkgrel=1
pkgdesc="django-mbtiles serves maps from MBTiles files using Django."
arch=('any')
url="https://github.com/makinacorpus/django-mbtiles"
license=('GPL')
groups=()
depends=('python2' 'python2-easydict' 'python2-landez1.7')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/$pypkgletter/$pypkgname/$pypkgname-$pkgver.tar.gz")
md5sums=('73e3966dea8f97d6ec010ba5afb992fe')

package() {
  cd "$srcdir/$pypkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
