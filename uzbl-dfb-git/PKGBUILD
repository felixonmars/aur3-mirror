# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=uzbl-dfb-git
pkgver=20100621
pkgrel=1
pkgdesc="All uzbl web interface tools: latest from the git master branch (With gtk2-dfb)"
arch=('i686' 'x86_64')
url="http://github.com/Dieterbe/uzbl/"
license=('GPL3')
depends=('libwebkit>=1.1.15' 'libsoup>=2.24' 'directfb')
optdepends=('socat: to interface with the socket' 'dmenu: to run some of the example scripts' 'bash: to run some of the example scripts' 'zenity: to run some of the example scripts' 'python: to run some of the example scripts' 'perl: for the example formfiller')
makedepends=('git' 'gtk2-dfb')
#provides=('uzbl' 'uzbl-git' 'uzbl-core' 'uzbl-browser')
provides=()
#conflicts=('uzbl' 'uzbl-git' 'uzbl-core' 'uzbl-browser')
conflicts=()
source=("gtk2-dfb.patch")
md5sums=('4ffaf239cc6cf7192241f1f1ad313866')

_gitname="uzbl"
_gitroot="git://github.com/Dieterbe/uzbl.git"

build() {
	msg "Connecting to GIT server..."
	if [[ -d $srcdir/$pkgname-$pkgver ]]; then
		cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
	else
		git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
		cd $srcdir/$pkgname-$pkgver
	fi

	msg "GIT checkout done or server timeout"

#	patch -p0 -i ../uzbl-dfb-gtk2.patch
  patch -p1 < ../gtk2-dfb.patch

	export PKG_CONFIG_PATH=/opt/gtkdfb/lib/pkgconfig:$PKG_CONFIG_PATH
#	export LD_LIBRARY_PATH=/opt/gtkdfb/lib

  echo $PKG_CONFIG_PATH

	make || return 1
	make DESTDIR=$pkgdir PREFIX=/opt/uzbl-dfb install
}

# vim:set ts=2 sw=2 et:
