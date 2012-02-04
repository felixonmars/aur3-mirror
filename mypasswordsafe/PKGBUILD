##
# Maintainer: Todd Harbour <lefallen@quadronyx.com.au>
# Contributor: 
# Comments: 
# Binary version available from: http://www.quadronyx.com.au/aur/
##

pkgname=mypasswordsafe
_pkgname=MyPasswordSafe
pkgver=20061216
pkgrel=1
pkgdesc="MyPasswordSafe is an easy-to-use QT based password manager, compatible with Password Safe files (and therefore pwsafe)."
url="http://www.semanticgap.com/myps/"
groups=
provides=
arch=('i686')
license=('GPL')
depends=( \
	'qt3' \
	'libxss' \
	)
makedepends=()
conflicts=()
replaces=()
backup=()
install=()
source=( \
	http://www.semanticgap.com/myps/release/$_pkgname-$pkgver.src.tgz \
	)
md5sums=( \
	'0fef98e77c8e593382fb201bd278cacf' \
	)

build() {
	cd $startdir/src/$_pkgname-$pkgver
	make || return 1
	mkdir -p $startdir/pkg/usr/bin/ || return 1
	mkdir -p $startdir/pkg/usr/share/MyPasswordSafe/locale/ || return 1
	PREFIX=$startdir/pkg/usr make install || return 1
}
