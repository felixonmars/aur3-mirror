# Contributor: mathieui <mathieuivi[at]gmail.com>
pkgname=pyjama-bzr
pkgrel=2
pkgver=247
pkgdesc="Unofficial Python/GTK Medialibrary for Jamendo - Bazaar version (experimental)"
arch=('i686' 'x86_64')
url="https://launchpad.net/pyjama"
conflicts=('pyjama')
license=('GPL')
makedepends=('bzr')
depends=('python' 'gnome-python' 'pygtk' 'python-simplejson' 'python-pysqlite' 'pyxml' 'gstreamer0.10-python' 'gstreamer0.10-bad-plugins' 'python-notify' 'gnome-python-extras' 'libtorrent') 
conflicts=('pyjama')
replaces=('pyjama')

_bzrtrunk=lp:pyjama
_bzrmod=pyjama

build() {
	cd ${srcdir}
	
	msg "Connecting to the server...."

	bzr branch ${_bzrtrunk} -q 

	msg "BZR checkout done or server timeout"
	msg "Starting make..."

	cd ./${_bzrmod}

	mkdir -p ${pkgdir}/usr/{bin,share/{pixmaps,applications,apps/pyjama}} 
	cp -R ${srcdir}/pyjama/* ${pkgdir}/usr/share/apps/pyjama/
	
	install -m644 ${pkgdir}/usr/share/apps/pyjama/images/pyjama.xpm ${pkgdir}/usr/share/pixmaps
	install -m644 ${pkgdir}/usr/share/apps/pyjama/pyjama.desktop ${pkgdir}/usr/share/applications

	# Symbolic link for /usr/bin
	ln -s /usr/share/apps/pyjama/pyjama.py ${pkgdir}/usr/bin/pyjama
}

