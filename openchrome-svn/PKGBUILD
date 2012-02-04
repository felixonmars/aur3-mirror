# Contributor: Richard Welsh

pkgname=openchrome-svn
pkgver=684
pkgrel=1
pkgdesc="Most developed drivers for Via Unichrome/Unichrome Pro under xorg"
arch=(i686 x86_64)
url="http://www.openchrome.org"
license=('MIT')
depends=('unichrome-dri')
makedepends=('subversion' 'versionpkg' 'pkgconfig' 'xorg-server>=1.1.1' 'xf86driproto' 'xorg-util-macros')
options=('!libtool' 'force')
conflicts=('xf86-video-via' 'xf86-video-unichrome')
provides=('openchrome')
source=()
md5sums=()

_svntrunk=http://svn.openchrome.org/svn/trunk
_svnmod=openchrome

build() {
  cd $startdir/src
  if [ -d $_svnmod/.svn ]; then
    msg "svn update.."
    cd $_svnmod
    svn up -r $pkgver || return 1
  else
    msg "svn checkout.."
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
    cd $_svnmod
  fi

    ./autogen.sh &> /dev/null
    make distclean &> /dev/null

    msg "SVN checkout done or the server timed out"


./configure --prefix=/usr || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -D -m644 $startdir/LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt
}
