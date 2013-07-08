# Maintainer: Klaas Boesche <klaas-dev@boesche.me>
pkgname=python-dmenuwrap
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple library to provide dmenu with options generated and handled with python. Examples can be found at the url."
arch=('any')
url="https://github.com/KaGeBe/${pkgname}"
license=('custom:BSD 2-clause')
depends=('python')
options=(!emptydirs)
source=("https://github.com/KaGeBe/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('d87f2177f151b18dfee0d54af868b347')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
