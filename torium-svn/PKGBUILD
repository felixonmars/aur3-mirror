# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=torium-svn
pkgver=141
pkgrel=1
pkgdesc="A minimalistic and easily configurable BitTorrent client"
arch=('i686' 'x86_64')
url="http://torium.sourceforge.net/"
license=('ISC')
depends=('gtkmm>=2.4' 'libtorrent-rasterbar>=0.13' 'libnotify')
makedepends=('subversion' 'autoconf' 'automake' 'make' 'pkgconfig>=0.9')
install=torium.install
provides=('torium')
conflicts=('torium')

_svntrunk="http://torium.svn.sourceforge.net/svnroot/torium/trunk"
_svnmod="torium"

build() {
  msg "Connecting to SVN server..."

  [ -d $_svnmod ] && {
	cd $_svnmod
	svn up -r $pkgver
	cd ..

	msg "Local files have been updated."
  } || {
	svn co $_svntrunk $_svnmod -r $pkgver --config-dir ./
  }

  msg "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  cp -rf $_svnmod/ $_svnmod-build/
  cd $_svnmod-build

  sed 's|    char \*v_tmp|    const char \*v_tmp|g' -i src/torrent.cc

  ./autogen.sh
  sed 's|CFLAGS="-g"|:|g' -i configure

  msg "Starting make..."

  ./configure	--prefix=/usr \
		--with-gconf-schema-file-dir=/usr/share/gconf/schemas \
		--disable-schemas-install

  make || return 1
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
