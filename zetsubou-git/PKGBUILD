pkgname=zetsubou-git
pkgver=20100322
pkgrel=1
pkgdesc="Zetsubou is an open source TPL creator and extractor for the PC. It is being created by SquidMan."
url="http://wiibrew.org/wiki/Benzin/Zetsubou"
license='GPL'
arch=('i686' 'x86_64')
depends=()
makedepends=('git')
provides=('zetsubou')

_gitroot='git://github.com/SquidMan/benzin.git'
_gitname='benzin'

build() {
    cd ${srcdir}

    msg "Connecting to github.com GIT server...."

    if [ -d ${srcdir}/$_gitname ] ; then
	cd $_gitname && git pull origin
	msg "The local files are updated."
    else
	git clone $_gitroot
	cd $_gitname
    fi

    cd zetsubou

    make

    mkdir -p $pkgdir/usr/bin
    cp zetsubou $pkgdir/usr/bin
}
