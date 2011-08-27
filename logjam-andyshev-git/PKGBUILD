# Contributor: Artem Kondratyev <konapt@gmail.com>

pkgname=logjam-andyshev-git 
pkgver=20110608
pkgrel=1
pkgdesc="GTK2 LiveJournal client, Andy Shevchenko's development branch"
arch=('i686' 'x86_64')
url="http://github.com/andy-shev/LogJam/"
license=('GPL2')
depends=(gtk2 pango libxml2 libsoup librsvg gtkspell sqlite3 gtkhtml)
makedepends=('git' 'autoconf>=2.53' 'automake>=1.9' 'libtool>=1.5' 'intltool>=0.30' 'perl-yaml')
conflicts=('logjam')
provides=('logjam=4.6.1')
install=logjam-andyshev-git.install

_gitroot="git://github.com/andy-shev/LogJam.git"
_gitname="LogJam"

build() {
	cd ${srcdir}
	msg "Connecting to github.com GIT server...."

	if [ -d ${srcdir}/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build
        
	cd ${srcdir}/$_gitname-build
    
        ./autogen.sh        
        ./configure --prefix=/usr || return 1
        make || return 1
        make DESTDIR=$pkgdir install || return 1

        rm -rf $srcdir/$_gitname-build
}
