# Maintainer: Weng Xuetian <wengxt@gmail.com>

pkgname=kimpanel-plasmoid-svn
pkgver=1090750
_realver=1090750
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'subversion' 'scim')
pkgdesc="IM Panel Plasmoid For KDE4.3,KDE From The Trunk Needed"
depends=('kdebase-workspace>=4.3')
optdepends=('ibus>=1.1.0' 'scim')
install=('kimpanel-plasmoid-svn.install')
url="http://websvn.kde.org/trunk/KDE/kdeplasma-addons/applets/kimpanel"
source=('collapse.patch' 'cmake.patch' 'position.patch' 'update.patch' 'CMakeLists.txt')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeplasma-addons
_svnmod=kdeplasma-addons

# build function

build() {
	cd ${srcdir}

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r ${_realver})
	else
		svn co $_svntrunk --config-dir ./ -r ${_realver} $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf $_svnmod-build
	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build
	
	msg "starting build ..."

	patch -p0 -i $srcdir/cmake.patch || return 1
	cp $srcdir/CMakeLists.txt applets/
	cd $srcdir/$_svnmod-build/applets/kimpanel
	patch -p0 -i $srcdir/collapse.patch || return 1
	patch -p0 -i $srcdir/position.patch || return 1
	patch -p0 -i $srcdir/update.patch || return 1

	cd $srcdir
	rm -rf build
	mkdir build
	cd build

	cmake ../${_svnmod}-build \
                -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_SKIP_RPATH=ON \
                -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
                -DCMAKE_INSTALL_PREFIX=/usr
	make || return 1

	# Hack to get the correct pkgver :)
	pkgver="${_realver}"

	# Make sure the pkgver is not null
	if [[ -n "${pkgver}" ]]; then
		export pkgver="${pkgver}"
	fi

}

package() {
	cd $srcdir/build/applets/kimpanel

	make DESTDIR=${pkgdir} install || return 1

	pkgver="${_realver}"
	# Export the pkgver if it is not null
	if [[ -n "${pkgver}" ]]; then
		export pkgver="${pkgver}"
		# Set the correct pkgver in the PKGBUILD
		sed -i 's/^\(\t\?\)pkgver=[0-9]\+$/\1pkgver='${pkgver}'/g' "${startdir}/PKGBUILD"
	fi


	mkdir -p ${pkgdir}/usr/share/ibus/ui/qt/
	mkdir -p ${pkgdir}/usr/share/ibus/component
	install -m755 $srcdir/kdeplasma-addons/applets/kimpanel/backend/ibus/panel.py ${pkgdir}/usr/share/ibus/ui/qt/
	install -m644 $srcdir/kdeplasma-addons/applets/kimpanel/backend/ibus/qtpanel.xml ${pkgdir}/usr/share/ibus/component
	:<<-'EOF'
	pkgver=
	EOF
} 
md5sums=('84059f25bbe345a413dcf7efa82ed41a'
         'c6b51156ba67dc4bc1a8cf1e0cf29bb9'
         '518929f5d5014381c130a698ee651fb1'
         '92bd53985a1c3aa881b08ca7a91ee668'
         '32489d6dd723b7518548bf8388d75a8e')
