# Contributor:  Roberth Sjonøy <roberth.sjonoy@gmail.com>

arch=('i686' 'x86_64')
pkgname=pidgimpd-svn
pkgver=23
pkgrel=3
pkgdesc="Pidgimpd-svn is an svn version of the MPD client for Pidgin."
url="http://mpd.wikia.com/wiki/Client:PidgiMPD"
license=GPL
depends=('pidgin')
makedepends=('subversion')
conflicts=('pidgimpd')
provides=('pidgimpd')
source=()
md5sums=()

_svntrunk=http://svn.ayeon.org/pidgimpd/trunk/
_svnmod=pidgimpd

build() {
 cd $startdir/src
 svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
 msg 'SVN checkout done or server timeout'
 
 rm -rf $_svnmod-build
 cp -a $_svnmod $_svnmod-build
 cd $_svnmod-build
 
 msg 'Starting make...'
 ./autogen.sh && ./configure || return 1
 make || return 1
 make DESTDIR=$startdir/pkg/ install || return 1 
}
