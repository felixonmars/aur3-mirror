#
# Dolphin Packages Kde-mod, part of chakra-project.org
#
# maintainer Vania Rupeni <vania.rupeni@gmail.com>

_origname=kdebase
#
# package info
#
pkgbase=('kdebase')
pkgname=('dolphin-kdemod')

arch=('i686' 'x86_64')
pkgver=4.6.0
pkgrel=2

pkgdesc="split package"
url="http://www.kde.org"
license=('GPL' 'LGPL' 'FDL')

options=('docs')

makedepends=("kdebase-workspace>=${_kdever}" 'pkgconfig' 'cmake' 'automoc4' 'libraw1394' 'ruby') # 'opencv'

source=("http://download.kde.org/stable/4.6.0/src/kdebase-4.6.0.tar.bz2"
	http://kde-apps.org/CONTENT/content-files/99752-kde_cdemu-0.3.tar.gz
	02_dolphin_properties.patch
	03_konsole_defaults.patch)

md5sums=('7d2d176c57f2e914acc89c39351ce5aa'
         'f98c26deff86b32a26e0238896d49382' # 99752-kde_cdemu-0.3.tar.gz
         '92a47ed820a541b34dd220e1da5649b7' # 02_dolphin_properties.patch
         '8ab6f508a4e04517dd51ac3ab2eb01ef') # 03_konsole_defaults.patch

build()
{
	cd ${_origname}-${pkgver}

	# branch update
	if [ "$_branchupdate" = "yes" ] ; then
		msg "applying branch update ..."
		pushd apps &>/dev/null
		patch -p0 -i $startdir/branch-update-r*.patch || return 1
		popd &>/dev/null
	else
		warning "branch updates disabled ..."
		warning "if you want to make use of it, run branch_updater.sh"
		warning "and enable branch updates in _/buildsystem/kdemod.conf"
	fi

	msg "applying main patchset ..."
	patch -Np1 -i ${startdir}/02_dolphin_properties.patch || return 1
	patch -Np1 -i ${startdir}/03_konsole_defaults.patch || return 1
	msg "starting build ..."
	cmake . -DCMAKE_BUILD_TYPE=${_build_type} \
		-DCMAKE_INSTALL_PREFIX=${_installprefix} \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed'

	make || return 1
}

package_kdebase-dolphin() {
	pkgdesc='File Manager'
	depends=('kdebase-runtime' 'kdebase-lib')
	optdepends=('ruby: servicemenu installation')
	url="http://kde.org/applications/system/dolphin/"
	cd $srcdir/build/apps/dolphin
	make DESTDIR=$pkgdir install
	cd $srcdir/build/apps/doc/dolphin
	make DESTDIR=$pkgdir install
}
