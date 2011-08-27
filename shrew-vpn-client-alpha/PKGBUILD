# Maintainer: Christian Hammacher <bmasterc gmail com>
# Contributor: Christian Hammacher <bmasterc gmail com>

pkgname=shrew-vpn-client-alpha
pkgver=2.2.0
pkgrel=9
pkgdesc="A portable VPN client for Linux with Qt GUI - alpha version"
arch=('i686' 'x86_64')
url="http://www.shrew.net/"
license=('osi')
depends=('qt' 'openssl')
makedepends=('gcc' 'flex' 'libedit' 'bison' 'cmake')
optdepends=('openldap')
provides=('shrew-vpn-client')
conflicts=('shrew-vpn-client')
install=('shrew-vpn-client.install')
backup=('etc/iked.conf')
source=(http://www.shrew.net/download/ike/ike-$pkgver-alpha-$pkgrel.tbz2)
md5sums=('602ba4856924bb71c08a5d97a0e95df5')

build() {
  cd $srcdir/ike

  # Build the whole package
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=YES -DETCDIR=/etc -DNATT=YES
  make all
  make DESTDIR="$pkgdir/" install
  
  # Install the daemon script
  install -D -m755 $startdir/iked $pkgdir/etc/rc.d/iked

  # The configuration file is already ready for use; just rename it
  mv $pkgdir/etc/iked.conf.sample $pkgdir/etc/iked.conf

  # Copy our desktop files
  install -D -m644 $srcdir/ike/source/ikea-qt/png/ikea.png $pkgdir/usr/share/icons/ikea.png
  install -D -m755 $startdir/ikea-qt.desktop $pkgdir/usr/share/applications/ikea-qt.desktop
}


