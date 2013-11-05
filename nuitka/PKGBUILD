# Maintainer: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

_name=Nuitka
pkgname=nuitka
pkgver=0.4.6.2
pkgrel=1
pkgdesc="A Python compiler to machine-code."
arch=(any)
url="http://www.nuitka.net/blog/"
license=('APACHE')
depends=('python2')
optdepends=()
#makedepends=('git')
provides=('nuitka')
conflicts=('nuitka-git')
replaces=()
backup=()
options=(!emptydirs)
source=(http://nuitka.net/releases/$_name-$pkgver.tar.gz)
md5sums=('2ffba72760de31902d882df4ac82445e')

package()
{
  # Install using setup.py
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
# vim: sw=2 ts=2 et:
