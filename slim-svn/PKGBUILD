# $Id: PKGBUILD 160692 2012-06-03 19:17:38Z tpowa $
# Maintainer: Christian Hesse <mail@eworm.de>
# Maintainer: Gaetan Bisson <bisson@archlinux.org> ([extra] package])
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Hugo Ideler <hugoideler@dse.nl>

pkgname=slim-svn
pkgver=223
pkgrel=1
pkgdesc='Desktop-independent graphical login manager for X11 - svn checkout'
arch=('i686' 'x86_64')
url='http://slim.berlios.de/'
license=('GPL2')
depends=('consolekit' 'pam' 'libxmu' 'libpng' 'libjpeg' 'libxft')
makedepends=('cmake' 'freeglut' 'cvs')
provides=('slim')
conflicts=('slim')
backup=('etc/slim.conf' 'etc/logrotate.d/slim' 'etc/pam.d/slim')
source=('slim-libpng.patch::http://developer.berlios.de/patch/download.php?id=3299'
        'rc.d'
        'pam.d'
        'logrotate'
        'slim.service'
        'ptr_pam.patch'
        'session-name.patch'
        'fix-numlock-1.3.3.patch')
install=install

_svntrunk="https://developername@svn.berlios.de/svnroot/repos/slim/trunk"
_svnmod="trunk"

build() {
	msg "Starting SVN checkout..."
	cd ${srcdir}
	if [ -d ${_svnmod}/.svn ]; then
		(cd ${_svnmod} && svn up -r ${pkgver})
	else
		svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
	fi
	
	msg "SVN checkout done or server timeout"
	msg "Creating build copy..."
	if [ -d ${srcdir}/${_svnmod}-build ]; then
		rm -rf ${_svnmod}-build
	fi
	cp -r "${_svnmod}" "${_svnmod}-build"

	cd ${srcdir}/${_svnmod}-build
	patch -Np1 < ${srcdir}/slim-libpng.patch

        mkdir ${srcdir}/build
        cd ${srcdir}/build
        cmake ../${_svnmod}-build \
                -DCMAKE_BUILD_TYPE=Release \
                -DCMAKE_SKIP_RPATH=ON \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DUSE_PAM=yes -DUSE_CONSOLEKIT=yes
	make
}

package() {
        cd  ${srcdir}/build/
	make DESTDIR="${pkgdir}" install

	install -D -m755 ../rc.d "${pkgdir}"/etc/rc.d/slim
	install -D -m644 ../pam.d "${pkgdir}"/etc/pam.d/slim
	install -D -m644 ../logrotate "${pkgdir}"/etc/logrotate.d/slim

	# Provide sane defaults
	sed -i 's|#xserver_arguments.*|xserver_arguments -nolisten tcp vt07|' "${pkgdir}"/etc/slim.conf
	sed -i 's|/var/run/slim.lock|/var/lock/slim.lock|' "${pkgdir}"/etc/slim.conf
        # install systemd files
        install -D -m644 ${srcdir}/slim.service ${pkgdir}/usr/lib/systemd/system/slim.service
}
sha256sums=('9f018c2ff2c0c1788ef59c6e17c66f71ba5ecdf22099c5acc79ae293c7b097c4'
            '10b97e044bd5a755c6c9710171cf0a94b493eab5dd1eb1deea94cbfbf6e89550'
            '69d4da0d9c6d2508cf09b7a115071ef085f88054df231b677ea88354950580ce'
            '5bf44748b5003f2332d8b268060c400120b9100d033fa9d35468670d827f6def'
            '178e5f77f3f8170174f3be47dcf16b1846a631bddaa6cb9ba6e8ef07152874ea'
            '5d97b8503dd7be5f3314b9b2109b1ca33a5b93f70dc63b551ea14996058c1618'
            'aa23f2a76e53982800816bea3f142bede089f7c994bbd357d3be5dabc40e70fc'
            '7c90623912bf9d1f7ea4da773daffd55cf3bd3a2e6e73e49572d5c2c4cfc9213')
