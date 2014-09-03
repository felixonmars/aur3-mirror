# Maintainer: Egor Sanin <egordotsaninatgmaildotcom>

pkgname=flinks
pkgver=0.4.3
pkgrel=1
pkgdesc="Flashing word browser"
arch=('any')
url="http://mbays.freeshell.org/flinks/"
license=('GPL3')
depends=('python' 'lynx')
options=(!emptydirs)
source=("$url/$pkgname-$pkgver.tar.gz")
md5sums=('3f6a5912739cdf7f5e398d17ed3d920d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
