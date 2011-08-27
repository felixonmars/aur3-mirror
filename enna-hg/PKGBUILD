#Contributor twa022 <twa022 at gmail dot com>

pkgname=enna-hg
pkgver=3557
#pkgrel=2
pkgrel=1
pkgdesc="EFL mediacenter which manages video, music, pictures"
arch=('i686' 'x86_64')
license=('BSD')
url="http://enna.geexbox.org/"
makedepends=('mercurial')
conflicts=('enna')
provides=('enna')
replaces=('enna' 'enna-cvs' 'enna-svn')
depends=('eet-svn' 'embryo-svn' 'edje-svn' 'ecore-svn' 'elementary-svn'
         'libplayer-hg' 'libvalhalla-hg' 'libxml2' 'emotion-svn'
         'eina-svn' 'efreet-svn' 'e_dbus-svn' 'curl' ) #'ethumb-svn'
source=()


_hgroot="http://hg.geexbox.org"
_hgrepo="enna"

build() {
  cd $srcdir
  hg clone -r $pkgver $_hgroot/$_hgrepo $_hgrepo
  cp -r $_hgrepo $_hgrepo-build
  cd $srcdir/$_hgrepo-build
  cd $srcdir/enna
  ./autogen.sh --prefix=/usr/ --disable-static --enable-browser-cdda \
     --enable-backend-emotion --enable-browser-netstreams --enable-browser-upnp

  make || return 1
  make DESTDIR=$startdir/pkg install

  install -D -m644 AUTHORS $startdir/pkg/usr/share/licenses/$pkgname/AUTHORS
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}

