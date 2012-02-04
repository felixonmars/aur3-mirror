# Contributor: Jimi Zelinskie <jimi@archlinux.us>

pkgname=termcolors
pkgver=20101202
pkgrel=1
pkgdesc="A simple bash script to display your terminal colors."
url="https://github.com/JimmyZelinskie/termcolors"
arch=('any')
license=('GPL')
depends=('bash')
makedepends=('git')
provides=('termcolors')
md5sums=()

_gitroot="git://github.com/JimmyZelinskie/termcolors.git"
_gitname="termcolors" 

build() {
  cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

  cd ${srcdir}/$_gitname

	install -D -m755 $_gitname ${pkgdir}/usr/bin/$_gitname || return 1

}
