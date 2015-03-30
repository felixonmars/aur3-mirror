pkgname=metapkg
pkgver=0.3.5
pkgrel=1
pkgdesc="Metapackage builder for pacman."
arch=(any)
url="https://github.com/Undeterminant/archlinux-metapkg"
license=(CC0)
depends=(python pyalpm python-click python-requests)
source=("https://pypi.python.org/packages/source/a/archlinux-metapkg/archlinux-metapkg-${pkgver}.tar.gz")
md5sums=('94e4c97013018b7435b726b54f4ff3b0')

build() {
  cd ${srcdir}/archlinux-metapkg-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/archlinux-metapkg-${pkgver}
  python setup.py install --root=${pkgdir}
}

