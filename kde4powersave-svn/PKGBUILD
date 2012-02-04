# KDE4PowerSave Subversion Package
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

pkgname=kde4powersave-svn
pkgver=896544
pkgrel=2

url="http://websvn.kde.org/trunk/playground/utils/kde4powersave/"
arch=('i686' 'x86_64')
pkgdesc="KDE4PowerSave is the KDE 4 frontend for powermanagement."

license=('GPL')

depends=('qt>=4.4.0' 'kdelibs>=4.1.0' 'kdebase-workspace>=4.1.0' 'phonon>=4.1.0' 'libx11' 'libxpm' 'perl')

makedepends=('subversion' 'cmake' 'automoc4' 'gcc')

provides=('kde4powersave')

source=()
md5sums=()

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/utils/"
_svnmod="kde4powersave"

# Create the package
build() {
	# Enter the source directory
	cd "${srcdir}"

	# Get the latest SVN source
	msg "Connecting to the SVN server..."

	# Update source if it already exists
	if [ -d "${_svnmod}/.svn" ]; then
		svn up "${_svnmod}" || return 1
	else
		svn co "${_svntrunk}/${_svnmod}" || return 1
	fi

	# Enter the svn dir
	cd "${_svnmod}"
	
	# Create the build files in the build directory
	cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
	
	# Make the package
	make || return 1
	
	# Install the files to the fakeroot directory
	install -m 755 "${srcdir}/${_svnmod}/lib/plasma_applet_powersave.so" \
		-D "${pkgdir}/usr/lib/kde4/plasma_applet_powersave.so"
	install -m 644 "${srcdir}/${_svnmod}/plasma-powersave-default.desktop" \
		-D "${pkgdir}/usr/share/kde4/services/plasma-powersave-default.desktop"
	
	# Only install battery.svg if it doesn't yet exist (unlikely)
	[ ! -f "${KDEDIR}/usr/share/apps/desktoptheme/default/widgets/battery.svg" ] || \
		install -m 644 "${srcdir}/${_svnmod}/battery.svg" \
			-D "${pkgdir}/usr/share/apps/desktoptheme/default/widgets/battery.svg"

	# Only install battery-oxygen.svg if it doesn't yet exist (also unlikely)
	[ ! -f "${KDEDIR}/usr/share/apps/desktoptheme/default/widgets/battery-oxygen.svg" ] || \
		install -m 644 "${srcdir}/${_svnmod}/battery-oxygen.svg" \
			-D "${pkgdir}/usr/share/apps/desktoptheme/default/widgets/battery-oxygen.svg"
}
