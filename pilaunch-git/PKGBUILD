pkgname=pilaunch-git
pkgver=20110628
pkgrel=1
pkgdesc="Menua/launcher with additional functionality (calc, mpd client, launch urls and web searches)"
arch=(any)
url=https://github.com/vincekd/Pilaunch
license=(GPL)
depends=(pygtk)
optdepends=("python-mpd: for the built in mpd client")
makedepends=(git)
install=$pkgname.install

_gitroot=https://github.com/vincekd/Pilaunch.git
_gitname=pilaunch

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi
	
	msg "GIT checkout done or server timeout"
}
package() {
	install -Dm755 "${srcdir}/${_gitname}/${_gitname}/${_gitname}.py" "${pkgdir}/usr/bin/${_gitname}"
	install -Dm644 "${srcdir}/${_gitname}/${_gitname}/piconfig.py" "${pkgdir}/usr/share/${_gitname}/piconfig.py"
	install -Dm644 "${srcdir}/${_gitname}/${_gitname}/pilaunchextra.py" "${pkgdir}/usr/share/${_gitname}/pilaunchextra.py"
}