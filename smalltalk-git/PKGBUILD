## PKGBUILD
# Maintainer: "Mark Doe" <mark.doe.priv@gmail.com>
#
pkgname=smalltalk-git
pkgver=20110618
pkgrel=1
pkgdesc="GNU Smalltalk (git version)"
url="http://smalltalk.gnu.org/"
license=('GPL')
depends=('gmp' 'zip' 'gdbm' 'sqlite3' 'readline' 'gtk2')
optdepends=('libsigsegv' 'libffi' 'libiconv' 'gnutls' 'cairo' 'sdl')
provides=('libsigsegv' 'libffi' 'libltd' )
conflicts=('smalltalk')
replaces=( )
arch=('i686' 'x86_64')

source=()

_gitroot="git://git.sv.gnu.org/smalltalk.git"
_gitname="smalltalk"

build() {
	cd "$srcdir"

	if [[ -d "$_gitname" ]]; then
		msg "Updating Git repository"
		(cd "$_gitname"; git pull origin) 
	else
		msg "Checking out fresh Git repository"
		git clone "$_gitroot"
	fi

	msg "Copying files"
	rm -rf "${_gitname}-build"
	rsync -a --exclude='.git' --delete "$_gitname/" "${_gitname}-build"

	msg "Start build gst, baby"
	cd "${_gitname}-build"

	autoreconf -vi

	_conf_opts="--prefix=/usr --with-imagedir=/var/lib/smalltalk"
	if hash emacs 2> /dev/null; then
	  ./configure ${_conf_opts}
	else
	  ./configure --without-emacs ${_conf_opts}
	fi

	make || return 1
	make check || return 1
	make DESTDIR="$pkgdir" install

	# fix manpage symlink
	#rm $pkgdir/usr/share/man/man1/gst-reload.1
	#ln -s /usr/share/man/man1/gst-load.1 $pkgdir/usr/share/man/man1/gst-reload.1
}
