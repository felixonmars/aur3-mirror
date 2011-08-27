
#Contributor: Erico Nunes <nunes.erico[at]gmail>
#Maintainer: Erico Nunes <nunes.erico[at]gmail>

pkgname=wolfenqt-git
pkgver=20110212
pkgrel=1
pkgdesc="Demo with Qt widgets embedded in a 3D scene."
arch=('any')
url="http://qt.gitorious.org/qt-labs/wolfenqt"
license=('BSD')
depends=('qt' 'libgl' 'phonon')
makedepends=('git')

source=('entity.patch'
	'mazescene.patch')

md5sums=('bb6cb57f4da200eee982d8abf6b6df96'
	'6ff8c2fd137eec048bfe165814f8b3f7')

_gitname="wolfenqt"
_gitroot="git://gitorious.org/qt-labs/wolfenqt.git"

build() {
	msg "Connecting to GIT server..."
	if [[ -d $srcdir/$pkgname-$pkgver ]]; then
		cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
	else
		git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
		cd $srcdir/$pkgname-$pkgver
	fi

	msg "GIT checkout done or server timeout"

	echo "INCLUDEPATH += /usr/include/KDE" >> $srcdir/$pkgname-$pkgver/$_gitname.pro
	echo "installfiles.files = $_gitname" >> $_gitname.pro
	echo "installfiles.path = $pkgdir/usr/bin" >> $_gitname.pro
	echo "INSTALLS += installfiles" >> $_gitname.pro

	patch entity.cpp $srcdir/entity.patch || return 1
	patch mazescene.cpp $srcdir/mazescene.patch || return 1

	qmake || return 1
	make || return 1
}

package () {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/$_gitname/textures/"

	cd "$srcdir/$pkgname-$pkgver"
	make install || return 1


	cp -r $srcdir/$pkgname-$pkgver/*.png "$pkgdir/usr/share/$_gitname/textures/"
	cp -r $srcdir/$pkgname-$pkgver/soldier "$pkgdir/usr/share/$_gitname"
}
