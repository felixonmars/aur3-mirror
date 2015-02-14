# Maintainer: maz-1 <loveayawaka at gmail dot com>

pkgname=lassistant
pkgver=1.1
pkgrel=1
pkgdesc="Qt5 GUI for Android SDK/ADB, Android phone manager."
arch=('x86_64' 'i686')
url="http://github.com/xsjqqq123/lassistant"
license=('LGPL2')
depends=('android-tools' 'qt5-base' 'axel')
makedepends=('qt5-tools')
source=("LAssistant-${pkgver}.zip::https://codeload.github.com/xsjqqq123/LAssistant/zip/${pkgver}"
		"lassistant.desktop"
		"lassistant.png"
		)
md5sums=('2a4bc8cfacb0025a3fe56241fb2e6438'
			'7c7e4ec076dc93930da02ad0581d8112'
			'fb34fca0ef37f87644b7fe3d7acc4044'
			)


prepare() {
        rm -rf ${srcdir}/build
        mkdir ${srcdir}/build
}
build() {
	cd "${srcdir}/build"
	qmake-qt5 ../LAssistant-${pkgver}/LAssistant.pro
	make
}

package() {
	cd "$srcdir/build"
	install -Dm 755 ./LAssistant ${pkgdir}/usr/bin/lassistant
	install -Dm 644 ${srcdir}/lassistant.png ${pkgdir}/usr/share/icons/lassistant.png
	install -Dm 644 ${srcdir}/lassistant.desktop ${pkgdir}/usr/share/applications/lassistant.desktop
}
