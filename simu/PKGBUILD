# Contributor: Aleshus <podskale@fel.cvut.cz>

pkgname=simu
pkgver=20110705
pkgrel=1
pkgdesc="Simu server project is aimed for IP telephony (VoIP) between classical SIP phones and Flash streaming applications."
url="http://semsung.felk.cvut.cz/dokuwiki/doku.php"
license="GPLv3"
arch=('i686' 'x86_64')
depends=('boost' 'pjproject' 'libconfig' 'util-linux')
make_depends=('cmake' 'make')
source=(simu.rc.d)
md5sums=("7db086e5d1fe612ea112580b970e4929")


_gitroot="git://simuserver.git.sourceforge.net/gitroot/simuserver/simuserver"
_gitname="git_git"

build() {
    msg "Checking repository version"
	cd $srcdir
	if [[ -d $_gitname ]]; then
	  (cd $_gitname && git pull origin)
	else
	  echo ok
	  git clone $_gitroot $_gitname
	fi
	cd $_gitname/Simu
 

    cmake CMakeLists.txt
	make all
	make DESTDIR=$pkgdir PREFIX="" install
	install -D -m755 $startdir/simu.rc.d $pkgdir/etc/rc.d/simu
}

