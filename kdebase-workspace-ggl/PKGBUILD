# $Id: PKGBUILD 133463 2011-07-28 09:27:47Z andrea $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdebase-workspace-ggl
_pkgname=kde-workspace
pkgver=4.7.0
pkgrel=2
pkgdesc="KDE Base Workspace"
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
groups=('kde')
# note on libxdamage:
# 	not detected by namcap because libgl depends on it
#	but nvidia providing libgl does not depend on libxdamage
depends=('kdepim-runtime' 'lm_sensors' 'libraw1394'  'libqalculate' 'qimageblitz'
         'polkit-kde' 'consolekit' 'xorg-xprop' 'libxdamage' 'libxklavier' 'libdmtx'
         'xorg-xsetroot' 'libxcomposite' 'libxinerama')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'boost' 'kdebindings-python')
optdepends=('kde-wallpapers: officials KDE wallapers')
replaces=('kdmtheme' 'kde-common' 'guidance-power-manager' 'policykit-kde' 'kdebase-kinfocenter')
conflicts=('kde-common' 'guidance-power-manager' 'policykit-kde' 'kdebase-kinfocenter')
install="${pkgname}.install"
options=('emptydirs')
source=("http://download.kde.org/stable/${pkgver}/src/${_pkgname}-${pkgver}.tar.bz2"
        'kdm-zsh-profile.patch' 'kdm' 'kde.pam' 'kde-np.pam' 'kscreensaver.pam'
        'fixpath.patch' 'terminate-server.patch')

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	patch -p0 -i ${srcdir}/kdm-zsh-profile.patch
	patch -p0 -i ${srcdir}/fixpath.patch
	patch -p0 -i ${srcdir}/terminate-server.patch

	cd ${srcdir}
	mkdir build
	cd build
	cmake ../${_pkgname}-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_Xmms=OFF \
        -DWITH_Googlegadgets=On \
        -DWITH_libgps=OFF \
        -DWITH_Prison=OFF \
        -DWITH_NetworkManager=OFF \
        -DKWIN_MOBILE_EFFECTS=OFF \
        -DWITH_OpenGLES=OFF \
        -DKWIN_BUILD_WITH_OPENGLES=OFF

	make plasma_package_ggl plasma_scriptengine_ggl
}

package() {
	cd "$srcdir/build"
	export DESTDIR=${pkgdir}
	cmake -P plasma/generic/scriptengines/google_gadgets/cmake_install.cmake
}
sha1sums=('cbc61a20013c746f424681020c29480c6249fd10'
          '8c2bdefb23a03b753b78d16944d03fa3939d2d99'
          '5db3a245201bd4a50e65aa2ef583cf5490e4f646'
          'f7b38af38549242a240f1a90ab9964ca8a366129'
          '603cc79c4d2b4eae62bb5f244aeecb3a778b5516'
          '106635aa1aae51d6f0668b1853f6c49a4fe9d3d8'
          'd7b5883f7e65c6839b1f65f94d58026673dd0226'
          'ac7bc292c865bc1ab8c02e6341aa7aeaf1a3eeee')
sha1sums=('cbc61a20013c746f424681020c29480c6249fd10'
          '8c2bdefb23a03b753b78d16944d03fa3939d2d99'
          '5db3a245201bd4a50e65aa2ef583cf5490e4f646'
          'f7b38af38549242a240f1a90ab9964ca8a366129'
          '603cc79c4d2b4eae62bb5f244aeecb3a778b5516'
          '106635aa1aae51d6f0668b1853f6c49a4fe9d3d8'
          'd7b5883f7e65c6839b1f65f94d58026673dd0226'
          'ac7bc292c865bc1ab8c02e6341aa7aeaf1a3eeee')
