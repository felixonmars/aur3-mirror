# Contributor: grte <greg.tees[at]gmail[dot]com>
# Contributor: SeeSchloss <seeschloss@seos.fr>

pkgname=museekplus-svn
pkgver=920                        
pkgrel=1
pkgdesc="Museek+ is a fork of Hyriand's C++ daemon/client Soulseek P2P client, with many enhancements."
url="http://www.museek-plus.org/"
depends=('libogg' 'libvorbis' 'pkgconfig' 'pygtk' 'python' 'qt')
makedepends=('subversion' 'cmake' 'swig' 'libxml++2')
license='GPL'
arch=('i686' 'x86_64')
source=()
md5sums=()

_svntrunk=http://www.museek-plus.org/svn/museek+/trunk/sources
_svnmod=museek+
_revnumber=$pkgver

build() {
        cd $startdir/src
        touch ~/.subversion

	svn co $_svntrunk --config-dir ./ -r $_revnumber $_svnmod
        cd $_svnmod

	cmake -DEVERYTHING=1 -DPREFIX=/usr || return 1
	make || return 1
	make DESTDIR="$pkgdir" install || return
	mkdir -p $startdir/pkg/etc/rc.d/ $startdir/pkg/var/museek/
	cp scripts/museekd.rc $startdir/pkg/etc/rc.d/museekd
}
