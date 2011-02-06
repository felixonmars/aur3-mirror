# Contributor: Yumi Nanako <yumileroy <at> yahoo.com>
pkgname=putty-yasushi-git
pkgver=20090716
pkgrel=1
pkgdesc="A client program for the SSH, Telnet and Rlogin network protocols with unofficial PuTTY patches by Yasushi"
arch=('i686' 'x86_64')
url=(http://github.com/Yasushi/putty/tree/master)
license=('MIT')

depends=('gtk2')
makedepends=('autoconf' 'automake' 'pkgconfig' 'git')
source=()
md5sums=()

_gitroot="git://github.com/Yasushi/putty.git"
_gitname="putty"

build() {
	cd ${srcdir}
	msg "Connecting to github.com GIT server...."
	
	if [ -d ${srcdir}/$_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
	else
	git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	git clone $_gitname $_gitname-build
	cd ${srcdir}/$_gitname-build

	echo -DSVN_REV="`git describe | sed -e 's/-/ /g' | awk '{print $3 " " $4}' | sed -e 's/ /-/g'`" > version.def
	sh ./mksrcarc.sh || return 1
	cd unix
	sed -i -e 's|CFLAGS = -O2|CFLAGS = -fno-strict-aliasing -O2|g' -e 's| && (cd ..; md5sum -c manifest)||g' Makefile.gtk
	make -f Makefile.gtk || return 1
	mkdir -p $startdir/pkg/usr/bin
  	install -Dm755 putty puttygen puttytel pterm psftp pscp plink \
		$startdir/pkg/usr/bin || return 1
}
