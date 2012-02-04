# Maintainer: Andrwe Lord Weber <lord-weber-andrwe [at] andrwe [dot] org>

pkgname=gopenvpn-svn
pkgver=7
pkgrel=1
pkgdesc="OpenVPN GTK front-end (mainly for Gnome)"
arch=('i686' 'x86_64')
url="http://gopenvpn.sourceforge.net/"
license=('GPL')
depends=( 'libglade' 'libgnome-keyring' 'gtk2' 'openvpn' )
makedepends=( 'automake' 'intltool' 'gcc' 'make' 'sed' 'subversion' 'sqlite3' )
optdepends=( 'gedit' 'gksu' )
source=('gksu-wrapper')
md5sums=('5ea81dd3f4c664e0295a8a17066789d8')
_svntrunk="https://gopenvpn.svn.sourceforge.net/svnroot/gopenvpn/trunk/gopenvpn"
_svnmod="gopenvpn"

build() {
	cd "${srcdir}"
	if [ -e "${srcdir}"/"${_svnmod}"/.svn ]
	then
		msg "Starting SVN update ..."
		cd "${srcdir}"/"${_svnmod}"/
		svn up
		msg "... update finished."
	else
		msg "Starting SVN checkout ..."
		svn co ${_svntrunk} ${_svnmod}
		msg "... checkout finished."
	fi

	if [ -e "${srcdir}"/"${_svnmod}-build" ]
	then
		rm -rf "${srcdir}"/"${_svnmod}-build"
	fi

	cp -r "${srcdir}"/"${_svnmod}" "${srcdir}"/"${_svnmod}-build"
	cd "${srcdir}"/"${_svnmod}-build"

	aclocal
	intltoolize	
	autoheader
	./autogen.sh

	# If you want to use gedit and gksu use this line
#	./configure --prefix=/usr
	# else set the path for the editor and gksu-wrapper-script (see: http://aur.archlinux.org/packages.php?ID=18821 ) here:
	./configure --prefix=/usr --with-gedit=/usr/bin/gvim --with-gksu=/usr/lib/gopenvpn/gksu-wrapper
	make || return 1
}

package() {
	cd "${srcdir}"/"${_svnmod}-build"
	
	make DESTDIR="${pkgdir}" install || return 1

	install -d "${pkgdir}"/usr/lib/gopenvpn/
	install -m 755 "${srcdir}"/gksu-wrapper "${pkgdir}"/usr/lib/gopenvpn/
}
