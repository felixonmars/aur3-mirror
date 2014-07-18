# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Evgenii Sovetkin <e dot sovetkin at gmail dot com>
pkgname=mega.py-duplicity
pkgver=136.4d8c508
pkgrel=1
# epoch=
pkgdesc="mega backend, python library for mega API for duplicity"
arch=('any')
url="https://github.com/ckornacker/mega.py"
license=('GPL')
#groups=()
depends=()
makedepends=('git')
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
options=('!emptydirs')
#install=
#changelog=
source=('mega.py::git+https://github.com/ckornacker/mega.py')
#noextract=()
#md5sums=() #generate with 'makepkg -g'
sha512sums=('SKIP')

pkgver() {
  cd mega.py
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


# prepare() {
# 	cd "$srcdir/$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

# build() {
# 	cd "$srcdir/$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

# check() {
# 	cd "$srcdir/$pkgname-$pkgver"
# 	make -k check
# }

package() {
  cd "${srcdir}/mega.py"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
