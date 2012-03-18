# Maintainer: Jonjo McKay <jonjo@xenolope.com>
pkgname=magicicada
pkgver=0.4.2
pkgrel=1
pkgdesc="A GTK+ frontend for the "Chicharra" part of Ubuntu One client."
arch=('x86_64')
url="https://launchpad.net/magicicada"
license=('GPL3')
groups=()
depends=('ubuntuone-client' 'ubuntuone-client-gnome')
makedepends=('python-distutils-extra')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://launchpad.net/magicicada/trunk/0.4.2/+download/magicicada-0.4.2.tar.gz")
md5sums=('448105ccc532e56159ff89831bbaa85d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
