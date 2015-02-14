# Maintainer: maz-1 <loveayawaka@gmail.com>

_pkgname=lassistant
pkgname=$_pkgname-git
pkgver=1.9c0b750
pkgrel=1
pkgdesc="Qt5 GUI for Android SDK/ADB, Android phone manager.Git version."
arch=('x86_64' 'i686')
url="http://github.com/xsjqqq123/lassistant"
license=('LGPL2')
depends=('android-tools' 'qt5-base' 'axel')
makedepends=('git' 'qt5-tools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git://github.com/xsjqqq123/$_pkgname.git"
		"lassistant.desktop"
		"lassistant.png"
		)
md5sums=('SKIP'
			'7c7e4ec076dc93930da02ad0581d8112'
			'fb34fca0ef37f87644b7fe3d7acc4044'
			)
_gitname=$_pkgname

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}
prepare() {
        rm -rf ${srcdir}/build
        mkdir ${srcdir}/build
}
build() {
	cd "${srcdir}/build"
	qmake-qt5 ../${_gitname}/LAssistant.pro
	make
}

package() {
	cd "$srcdir/build"
	install -Dm 755 ./LAssistant ${pkgdir}/usr/bin/lassistant
	install -Dm 644 ${srcdir}/lassistant.png ${pkgdir}/usr/share/icons/lassistant.png
	install -Dm 644 ${srcdir}/lassistant.desktop ${pkgdir}/usr/share/applications/lassistant.desktop
}
