# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=pidgin-talkfilters
pkgver=2.5.1
pkgrel=1
pkgdesc="Implements GNU Talkfilters in pidgin chats"
arch=(i686 x86_64)
url="http://plugins.guifications.org/trac/wiki/PluginPack"
license=('GPL2')
depends=('pidgin' 'talkfilters')
makedepends=('intltool' 'python')
options=(!libtool)
source=(http://plugins.guifications.org/trac/downloads/22)
md5sums=('c7026ed4e9fd3d1de4bed783aa1d9e00')

build() {
  cd $startdir/src/purple-plugin_pack-$pkgver
  
  # For some reason the python script returns talkfilters when
  # you query the plugins that depend on pidgin but when you query the
  # plugins that depend on talkfilters (which something tries to do
  # when it's deciding to build talkfilters or not) it returns nothing.

  sed -i -e 's/$DEPENDENCIES/pidgin/g' plugin_pack.m4
  libtoolize --force --copy || return 1
  aclocal || return 1
  autoconf || return 1
  automake || return 1
  
  ./configure --prefix=/usr --with-plugins=talkfilters
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm -rf ${pkgdir}/usr/share
}
