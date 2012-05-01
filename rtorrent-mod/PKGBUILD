# Maintainer: karabaja4 <karabaja4 at gmail.com>
# Contributor: Cloudef (ported patch to 0.8.9)

pkgname=rtorrent-mod
pkgver=0.8.9
pkgrel=2
pkgdesc="rtorrent client with custom interface"
arch=('i686' 'x86_64')
url="http://libtorrent.rakshasa.no"
license=('GPL')
depends=('libtorrent=0.12.9' 'curl' 'xmlrpc-c')
source=(http://libtorrent.rakshasa.no/downloads/rtorrent-$pkgver.tar.gz
	rtorrent-mod-v3.patch
	rtorrent.rc.example
	rtorrent-0.8.9_buildfix_gcc47.patch)
md5sums=('629247636cb1210663b52dadbd040a6c'
	 '48ebc4cdb0e7a8abf94ca63738e0b83a'
	 '5121a10782f59de30357e55f907155d3'
	 '041fc5d3c3fed0dfb85b3374e2f35df9')
provides=('rtorrent')
conflicts=('rtorrent' 'rtorrent-color' 'rtorrent-extended' \ 
	   'rtorrent-svn' 'rtorrent-unstable' 'rtorrent-vi-color')

build() {
  cd "$srcdir/rtorrent-$pkgver"
  
  #patch the interface
  msg "Applying interface patch..."
  patch -p0 -i ../rtorrent-mod-v3.patch
  patch -p1 -i ../rtorrent-0.8.9_buildfix_gcc47.patch

  #example file
  mkdir -p ${pkgdir}/usr/share/rtorrent-mod/example-rc/
  cp ${srcdir}/rtorrent.rc.example ${pkgdir}/usr/share/rtorrent-mod/example-rc/

  #make
  CXXFLAGS="$CXXFLAGS -fno-strict-aliasing -lpthread -fpermissive" \
    ./configure --prefix=/usr --disable-debug --with-xmlrpc-c || return 1
  make || return 1
  make DESTDIR="$pkgdir" install
}
