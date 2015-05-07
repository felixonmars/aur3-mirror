# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=qilqay
pkgver=1
pkgrel=0
epoch=
pkgdesc="Academic Tool to be used in the Logic Programming Learning first course."
arch=('any')
url="https://github.com/GonzaloHernandez/qilqay.git"
license=('GPL')
groups=()
depends=('git' 'qtcreator')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git://github.com/GonzaloHernandez/qilqay.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	printf "r%s" "$(git rev-list --count HEAD)"
}

#prepare() {
	#cd "$pkgname-$pkgver"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#build() {
	#cd "$pkgname-$pkgver"
	#./configure --prefix=/usr
	#make
#}

#check() {
	#cd "$pkgname-$pkgver"
	#make -k check
#}

package() {
	mkdir -p $pkgdir/usr/share/qtcreator/templates/wizards
	cp -r $srcdir/$pkgname/qilqay-wizard $pkgdir/usr/share/qtcreator/templates/wizards
}
