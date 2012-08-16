# Maintainer: Vinycius Maia <suportevg@uol.com.br>

pkgname=kde-light
pkgdesc='kde as lightweight as possible'
pkgver=4.9.0
pkgrel=1
url='http://kde.org'
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt'
         'qtwebkit'
         'polkit-qt'
         'polkit-kde'
         'attica'
         "kdelibs=${pkgver}"
	     "kdebase-workspace=${pkgver}"
	     "kdebase-runtime=${pkgver}"
	     "kdebase-runtime=${pkgver}"
	     "kdebase-kdepasswd=${pkgver}"
	     "kdebase-konsole"
	     'phonon'
	     'kdemultimedia-kmix')
makedepends=('cmake' 'pkg-config' 'git' 'wget')

_soprano_pkgver=2.8.0
_soprano_pkgname=libsoprano
_soprano__pkgname=soprano

_libstreams_pkgver=0.7.7
_libstreams_pkgname=libstreams

_libstreamanalyzer_pkgver=0.7.7
_libstreamanalyzer_pkgname=libstreamanalyzer

source=("http://downloads.sourceforge.net/project/${_soprano__pkgname}/Soprano/${_soprano_pkgver}/${_soprano__pkgname}-${_soprano_pkgver}.tar.bz2"
        'kde-light.install')
md5sums=('273c3403aeb6d8a43e78a4887f50a385'
         '3b2620ab3a27138c38bfdbee4e71b795')

true && pkgname=('kde-light'
                 'akonadi-kde-light'
                 'nepomuk-core-kde-light'
                 'libsoprano-kde-light'
                 'libstreams-kde-light'
                 'libstreamanalyzer-kde-light')

build() {
	echo -e "\n Warning: This package have subpackages,"
	echo -e " is recommended build with makepkg.\n"
	echo    " Install with: pacman -U *.tar.xz"
	echo -e " cyclic dependencies are expected, ignore.\n"
	echo -e " Press a key to continue or ctrl+c to exit\n"; read
	
	cd "${srcdir}"
	msg "Downloading faststartkde... "
	if [ ! -f faststartkde ]; then rm -f faststartkde; fi
	wget https://raw.github.com/mrk3004/tools/master/faststartkde
	# build libsoprano
	msg "Building libsoprano"
	cd "${srcdir}/${_soprano__pkgname}-${_soprano_pkgver}"
	if [ -e build ]; then rm -rf build; fi
	mkdir build && cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release \
	         -DCMAKE_SKIP_RPATH=OFF \
	         -DCMAKE_INSTALL_PREFIX=/usr \
	         -DSOPRANO_DISABLE_CLUCENE_INDEX=ON
	make
	
	#build libstreams
	msg "Building libstreams"
	cd "${srcdir}"
	if [ -e ${_libstreams_pkgname} ]; then
		cd ${_libstreams_pkgname}
		git pull
	else
		git clone git://anongit.kde.org/${_libstreams_pkgname}
		cd ${_libstreams_pkgname}
	fi
	if [ -e build ]; then rm -rf build; fi
	mkdir build && cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
	
	#build libstreamanalyzer
	msg "Building libstreamanalyzer"
	cd "${srcdir}"
	if [ -e ${_libstreamanalyzer_pkgname} ]; then
		cd ${_libstreamanalyzer_pkgname}
		git pull
	else
		git clone git://anongit.kde.org/${_libstreamanalyzer_pkgname}
		cd ${_libstreamanalyzer_pkgname}
	fi
	if [ -e build ]; then rm -rf build; fi
	mkdir build && cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release \
	         -DCMAKE_INSTALL_PREFIX=/usr \
	         -DENABLE_FFMPEG=OFF
	make
}

package_kde-light() {
	depends+=('akonadi-kde-light'
             'nepomuk-core-kde-light'
             'libsoprano-kde-light'
             'libstreams-kde-light'
             'libstreamanalyzer-kde-light')
	optdepends=('kde-wallpapers: Wallpapers for your desktop'
                'kde-base-workspace-systemd: for systemd users'
                "kde-110n-${LANG%%.*}: kde in your language"
                "kdebase-dolphin: File Manager")
    replaces=('strigi')
    install="${pkgname}.install"
	mkdir -p "${pkgdir}/usr/bin"
	install -m755 "${srcdir}/faststartkde" "${pkgdir}/usr/bin/"
}

package_akonadi-kde-light() {
	pkgname=akonadi-kde-light
	pkgver=fake
	pkgrel=1
	pkgdesc="A fake akonadi package"
	arch=('any')
	license=('None')
	depends=('kde-light')
	conflicts=('akonadi' 'akonadi-fake')
	provides=("akonadi=${pkgver}" "akonadi-fake")
	
	rm -rf "${pkgdir}/"*
}

package_nepomuk-core-kde-light() {
	pkgname=nepomuk-core-kde-light
	pkgver=fake
	pkgrel=1
	pkgdesc="A fake nepomuk package"
	arch=('any')
	license=('None')
	depends=('kde-light')
	conflicts=('nepomuk-core' 'nepomuk-fake')
	provides=("nepomuk-core=${pkgver}" "nepomuk-fake")
	
	rm -rf "${pkgdir}/"*
}

package_libsoprano-kde-light() {
	pkgname=libsoprano-kde-light
	pkgver=2.8.0
	arch=('i686' 'x86_64')
	license=('GPL' 'LGPL')
	depends=('qt' 'kde-light')
	conflicts=('soprano')
	provides=("soprano=fake" "soprano-kde-light=fake" "libsoprano=${pkgver}")
	
	cd "${srcdir}/${_soprano__pkgname}-${_soprano_pkgver}/build"
	make DESTDIR="${pkgdir}" install
	rm -r "${pkgdir}/usr/bin/"
	rm -r "${pkgdir}/usr/share/"
}

package_libstreams-kde-light() {
	pkgname=libstreams-kde-light
	pkgver=0.7.7
	pkgrel=1
	pkgdesc="Strigi ${pkgname}"
	arch=('i686' 'x86_64')
	url="https://projects.kde.org/projects/kdesupport/strigi/${pkgname}/repository"
	license=('GPL2')
	depends=('kde-light')
	conflicts=('strigi' 'libstreams')
	provides=("libstreams=${pkgver}")
	
	cd "${srcdir}/${_libstreams_pkgname}/build"
	rm -rf "${pkgdir}/"*
	make DESTDIR="${pkgdir}" install
}

package_libstreamanalyzer-kde-light() {
	pkgname=libstreamanalyzer-kde-light
	pkgver=0.7.7
	pkgrel=1
	pkgdesc="Strigi ${pkgname}"
	arch=('i686' 'x86_64')
	url="https://projects.kde.org/projects/kdesupport/strigi/${pkgname}/repository"
	license=('GPL2')
	depends=("libstreams=${pkgver}" "soprano=fake" 'kde-light')
	conflicts=('strigi' 'libstreamanalyzer')
	provides=("libstreamanalyzer=${pkgver}")
	
	cd "${srcdir}/${_libstreamanalyzer_pkgname}/build"
	rm -rf "${pkgdir}/"*
	make DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}/usr/share"
}
