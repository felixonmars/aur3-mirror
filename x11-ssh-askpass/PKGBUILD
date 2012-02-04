# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=x11-ssh-askpass
pkgver=1.2.4.1
pkgrel=2
pkgdesc="a lightweight passphrase dialog for OpenSSH or other open variants of SSH."
arch=('i686' 'x86_64')
license=('custom')
url="http://www.jmknoble.net/software/x11-ssh-askpass/"
depends=( 'x-server' 'openssh' )
makedepends=('imake')
provides=('x11-ssh-askpass')
source=(http://projects.arcs.org.au/trac/systems/export/1623/trunk/rpms/SOURCES/$pkgname-$pkgver.tar.gz
	x11-ssh-askpass.sh LICENSE)

md5sums=('8f2e41f3f7eaa8543a2440454637f3c3' '19c1ae8d716de93e88d633ea322a4c7b'
	'15aca767eeee86273c567a52e2da7d82')

build() {
  cd $srcdir/$pkgname-$pkgver
  # libexec redirected per archlinux package guidelines
  ./configure --libexecdir=/usr/lib/openssh --mandir=/usr/share/man/
  xmkmf
  make includes
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  make DESTDIR=$pkgdir install.man
  mkdir -p $pkgdir/etc/profile.d
  install -m755 $srcdir/x11-ssh-askpass.sh $pkgdir/etc/profile.d/
  install -D -m644 ../LICENSE $pkgdir/usr/share/licenses/x11-ssh-askpass/LICENSE
}
