# Contributors: 
#   Flamelab <panosfilip@gmail.com>
#   staticsafe <sadiq.9541@gmail.com>

# Compiz PKGBUILDs are based on "some-guy"'s previous PKGBUILDs

# Put the desired install prefix HERE
_iprefix=/opt/unity

pkgname=compiz-core-unity-git
pkgver=20110614
pkgrel=1
pkgdesc="Compiz is an extensible window manager utilizing opengl for effects and usability. Package meant for use with Unity."
url="http://www.compiz.org/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('startup-notification' 'librsvg' 'libgl' 'dbus' 'glibmm'
         'mesa' 'libxslt' 'fuse' 'boost' 'libstdc++5' 'gnome-control-center')
makedepends=('intltool' 'git' 'cmake' 'kdebase-plasma' 'kdebase-workspace')
conflicts=('compiz-core-09')
options=(!libtool !emptydirs)
source=()
md5sums=()
_gitroot="git://git.compiz.org/users/dbo/compiz-with-glib-mainloop"
_gitname="compiz-core"
install=compiz-core-unity-git.install

# trick re-determining the build revision and, or entertain the hidden
# makepkg option --forcever, huh
if [ -z "${FORCE_VER}" ]; then
    msg "Determining latest build revision..."
    FORCE_VER=$(date +%Y%m%d)
fi

build()
{
	cd "${srcdir}"
	msg "Connecting to GIT server...."

	if [ -d "${_gitname}" ] ; then
		cd "${_gitname}" && git pull origin
		msg "The local files are updated."
	else
		git clone "${_gitroot}" "${_gitname}"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	cd "${srcdir}/${_gitname}"
	[[ -d build ]] || mkdir build
	cd build
	env cmake .. -DCMAKE_INSTALL_PREFIX="${_iprefix}" -DCMAKE_BUILD_TYPE=Debug -DCOMPIZ_DESTDIR="${pkgdir}"
	make
	

}

package()

{
	cd "${srcdir}/${_gitname}/build"
	make install
	if [[ -d "${pkgdir}/usr" ]]; then
		msg "Removing potentially conflicting files..."
		find "${pkgdir}/usr" -type f | sed "s:^${pkgdir}::"
		rm -rf "${pkgdir}/usr"
	fi
	_cmake_root=$(sed -n 's/CMAKE_ROOT:INTERNAL=//p' CMakeCache.txt)
	mkdir -p "${pkgdir}${_cmake_root}/Modules"
	make findcompiz_install || return 1
	mkdir -p "$pkgdir/usr/bin"
	msg "Making /usr/bin symlinks..."
	ln -s "${_iprefix}/bin/compiz" "$pkgdir/usr/bin/compiz-git"
	[[ -f "${pkgdir}${_iprefix}/bin/gtk-window-decorator" ]] && \
		ln -s "${_iprefix}/bin/gtk-window-decorator" "$pkgdir/usr/bin/gtk-window-decorator-git" || true
	[[ -f "${pkgdir}${_iprefix}/bin/kde4-window-decorator" ]] && \
		ln -s "${_iprefix}/bin/kde4-window-decorator" "$pkgdir/usr/bin/kde4-window-decorator-git" || true
}
