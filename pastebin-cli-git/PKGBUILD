# Contributor: Sychopx <infinity.illusion@gmail.com>

pkgname=pastebin-cli-git
pkgver=20110218
pkgrel=1
pkgdesc="Command line tool for pasting to pastebin"
arch=('i686' 'x86_64')
url="http://zhehaomao.com/software/pastebin-cli/"
license=('BSD')
depends=('curl')
makedepends=('git')
provides=('pastebin')

_gitroot="git://github.com/zhemao/pastebin-cli.git"
_gitname="pastebin-cli"

build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."

	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf ${srcdir}/${_gitname}-build
	git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
	cd ${srcdir}/${_gitname}-build
        
        make DESTDIR=$pkgdir || return 1
  
	install -D -m755 pastebin ${pkgdir}/usr/bin/pastebin || return 1
} 


