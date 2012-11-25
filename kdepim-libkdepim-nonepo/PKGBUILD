# $Id$
# Maintainer: gnumdk@gmail.com

pkgbase=kdepim
pkgname=kdepim-libkdepim-nonepo
pkgver=4.9.3
pkgrel=1
arch=('i686' 'x86_64')
url='http://pim.kde.org'
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdepim')
makedepends=('cmake' 'automoc4' 'boost' 'kdepim-runtime' 'libxss' 'pilot-link'
             'kde-agent')
source=("http://download.kde.org/stable/${pkgver}/src/${pkgbase}-${pkgver}.tar.xz"
        'fix-build.patch' 'no-nepo.patch')
sha1sums=('5f0786a85db599a7b566a5d02d19c55222a64bcc'
          '880c6e73fa787dc5e2835790733a24872e9c7327'
          '05a8c01dbde11065de9ae5fb8d15bc6b326b9bf4')

build() {
    cd ${pkgbase}-${pkgver}
    patch -p1 -i "${srcdir}"/fix-build.patch
    patch -p1 -i "${srcdir}"/no-nepo.patch
    cd ..

	mkdir build
	cd build
	cmake ../${pkgbase}-${pkgver} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
        -DKDEPIM_BUILD_MOBILE=OFF
        cd libkdepim
	make
}

package_kdepim-libkdepim-nonepo() {
	pkgdesc='Library for KDE PIM (enable contact search in kmail without nepomuk)'
	groups=()
	depends=('kde-agent' 'kdepim-runtime')
	url='http://pim.kde.org'
	conflicts=('kdepim-icons' 'kdepim-libkleo' 'kdepim-libkpgp'
	            'kdepim-strigi-analyzer' 'kdepim-akonadi' 'kdepim-libkdepim')
	replaces=('kdepim-icons' 'kdepim-libkleo' 'kdepim-libkpgp'
	          'kdepim-strigi-analyzer' 'kdepim-akonadi' 'kdepim-libkdepim')
	provides=('kdepim-libkdepim')
	for i in akonadi_next calendarsupport incidenceeditor-ng \
	kdgantt2 libkdepim libkdepimdbusinterfaces libkleo libkpgp \
	mailcommon messagecomposer messagecore messageviewer icons \
	strigi-analyzer templateparser plugins/messageviewer \
	plugins/ktexteditor; do
		cd "${srcdir}"/build/${i}
		make DESTDIR="${pkgdir}" install
	done
}
