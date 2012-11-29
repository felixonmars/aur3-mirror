# Maintainer: Vinycius Maia <suportevg@uol.com.br>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdebase-workspace-systemd
_pkgname=kde-workspace
pkgver=4.9.3
pkgrel=1

pkgdesc="Provides the interface and basic tools for the KDE workspace"
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('GPL' 'LGPL' 'FDL')

arch=('i686' 'x86_64')
groups=('kde')

# note on libxdamage:
# 	not detected by namcap because libgl depends on it
#	but nvidia providing libgl does not depend on libxdamage
depends=('kdepim-runtime' 'lm_sensors' 'libraw1394' 'libqalculate'
         'qimageblitz' 'polkit-kde' 'xorg-xprop' 'libxdamage'
         'libxklavier' 'xorg-xsetroot' 'libxcomposite' 'libxinerama'
         'xorg-xrdb' 'libgles' 'libegl' 'libxres' 'xorg-xrandr'
         'xorg-xmessage' 'libusb-compat' 'kde-base-artwork')
	 
makedepends=('cmake' 'automoc4' 'boost' 'kdebindings-python2' 'networkmanager' 'mesa')

optdepends=('kde-wallpapers: wallpapers for KDE Plasma Workspaces')

conflicts=('kdebase-workspace')

provides=("kdebase-workspace=${pkgver}")

install="${pkgname}.install"

backup=('usr/share/config/kdm/kdmrc')
	
options=('emptydirs')

source=("http://download.kde.org/stable/${pkgver}/src/${_pkgname}-${pkgver}.tar.xz"
        'kdm' 'kde.pam' 'kde-np.pam' 'kscreensaver.pam' 'kdm.service' 'kdm.logrotate'
        'etc-scripts.patch' 'terminate-server.patch' 'kdm-xinitrd.patch'
        'native-systemd-support.patch')
	
sha1sums=('f6c527361e76aacae980f661294b32a7f3df46a0'
          '5db3a245201bd4a50e65aa2ef583cf5490e4f646'
          '660eae40a707d2711d8d7f32a93214865506b795'
          '6aeecc9e0e221f0515c6bf544f9a3c11cb6961fe'
          '106635aa1aae51d6f0668b1853f6c49a4fe9d3d8'
          'b6f8e8692737b11eec1f8022ce74b5b23e247b1b'
          'bbe55f2000217474ce7246f12ee437ceaaf7e9ae'
          'c079ebd157c836ba996190f0d2bcea1a7828d02c'
          'ac7bc292c865bc1ab8c02e6341aa7aeaf1a3eeee'
          'd509dac592bd8b310df27991b208c95b6d907514'
          '92a3ae63fbfae7aac36610edf5fd25fba9b6fea9')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	
    patch -p0 -i ../etc-scripts.patch             # reads the shell scripts in /etc/kde
	patch -p1 -i ../kdm-xinitrd.patch             # FS#26120             
	patch -p0 -i ../terminate-server.patch        # KDEBUG#202629
	patch -p1 -i ../native-systemd-support.patch  # KDEBUG#94714
	
	test ! -e build && mkdir build
	cd build
	
	cmake .. -DCMAKE_BUILD_TYPE=Release   \
        -DCMAKE_SKIP_RPATH=ON             \
        -DCMAKE_INSTALL_PREFIX=/usr       \
        -DWITH_Xmms=OFF                   \
        -DWITH_Googlegadgets=OFF          \
        -DWITH_libgps=OFF                 \
        -DKWORKSPACE_USE_SYSTEMD:BOOL=ON  \
        -DWITH_CkConnector=OFF \
        -DPYTHON_EXECUTABLE=/usr/bin/python2
	
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/build"
	
	make DESTDIR="${pkgdir}" install

	install -D -m644 "${srcdir}"/kde.pam "${pkgdir}"/etc/pam.d/kde
	install -D -m644 "${srcdir}"/kde-np.pam "${pkgdir}"/etc/pam.d/kde-np
	install -D -m644 "${srcdir}"/kscreensaver.pam "${pkgdir}"/etc/pam.d/kscreensaver

	install -d -m755 "${pkgdir}"/usr/share/xsessions/
	ln -sf /usr/share/apps/kdm/sessions/kde-plasma{,-safe}.desktop \
	"${pkgdir}"/usr/share/xsessions/
	install -d -m755 "${pkgdir}"/etc/kde/{env,shutdown}

	install -d -g 135 -o 135 "${pkgdir}"/var/lib/kdm
	install -D -m755 "${srcdir}"/kdm "${pkgdir}"/etc/rc.d/kdm
	install -D -m644 "${srcdir}"/kdm.service \
	"${pkgdir}"/usr/lib/systemd/system/kdm.service
    install -Dm644 "${srcdir}"/kdm.logrotate "${pkgdir}"/etc/logrotate.d/kdm
}
