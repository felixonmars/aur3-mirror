# Maintainer : Emanuel Guillen <mast3er@gmail.com>
pkgname=('transmission-cli-svn')
pkgver=200130419
pkgrel=1
pkgdesc="Fast, easy, and free BitTorrent client (CLI tools, daemon and web client) SVN"
arch=('i686' 'x86_64')
url="http://www.transmissionbt.com/"
license=('MIT')
makedepends=('curl' 'libevent' 'subversion' 'intltool')
depends=('curl' 'libevent')
provides=('transmission-cli')
conflicts=('transmission-cli')
backup=('etc/conf.d/transmissiond')
install=transmission-cli.install
source=(transmissiond transmissiond.conf transmission.systemd
        transmission.tmpfiles)
md5sums=('7d6186ee2a852ae3d44980f05063e194'
         'db72b02fee139e8ab416324e6c044d76'
         '5c289c8901221a94be74665368ab5c2c'
         '23f2320361ad54373c3a4551ef634fe8')


_svntrunk="svn://svn.transmissionbt.com/Transmission/trunk"
_svnmod="Transmission"

build() {
  cd "$srcdir"
  svn co "$_svntrunk" "$_svnmod"

  [[ -d "$srcdir/$_svnmod-build" ]] && rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  ./autogen.sh --prefix=/usr --disable-gtk
  make
}
package() {
  cd "$srcdir/$_svnmod-build"

  for dir in daemon cli web utils
  do
      make -C "$dir" DESTDIR="$pkgdir" install
  done

  install -D -m755 "$srcdir/transmissiond" "$pkgdir/etc/rc.d/transmissiond"
  install -D -m644 "$srcdir/transmissiond.conf" "$pkgdir/etc/conf.d/transmissiond"
  install -D -m644 "$srcdir/transmission.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
  install -D -m644 "$srcdir/transmission.systemd" "$pkgdir/usr/lib/systemd/system/transmission.service"
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/transmission-cli-svn/COPYING"
}
