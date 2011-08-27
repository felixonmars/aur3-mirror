# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=timeclock-git
pkgver=20091020
pkgrel=1
pkgdesc="a simple utility for people who suffer from excessive procrastination or distractibility"
arch=('any')
url="http://ssokolow.github.com/timeclock/"
license=('GPL')
depends=('python' 'pygtk' 'python-notify')
#options=('!libtool')
source=()
md5sums=()

_gitroot=git://github.com/Svenstaro/timeclock
_gitname=timeclock

build() {
	cd ${srcdir}
	msg "Connecting to github.com GIT server..."

	if [ -d ${srcdir}/$_gitname ]; then
		cd $_gitname && git pull origin || return 1
		msg "The local files are updated."
	else
		git clone $_gitroot || return 1
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	if [ -d ${srcdir}/$_gitname-build ]; then
		rm -rf ${srcdir}/$_gitname-build
	fi

	git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build || return 1
	cd ${srcdir}/$_gitname-build/ || return 1

  sed -i s'/cd $(DESTDIR)\/usr\/share/cd \/usr\/share/' Makefile
	make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:

