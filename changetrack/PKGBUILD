# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname='changetrack'
pkgver='4_7'
pkgrel=2
pkgdesc="logs modifications of a set of files, and allows recovery of the tracked files at any stage of change"
arch=(i686 x86_64)
url="http://changetrack.sourceforge.net"
license=('GPL')
depends=('rcs' 'perl')
backup=("etc/changetrack.conf")
install=changetrack.install
source=(http://changetrack.sourceforge.net/change${pkgver}.tar.gz)
md5sums=('6a0081cf5d385c0b1fb690507acd73a2')


build() {
  cd "$srcdir/$pkgname"
  make test
}

package() {
  cd "$srcdir/$pkgname"
	install -D -m 0755 changetrack $pkgdir/usr/bin/changetrack
	install -D -m 0644 changetrack.man $pkgdir/usr/share/man/man1/changetrack.1
	install -D -m 0644 README $pkgdir/usr/share/doc/changetrack/README
	install -D -m 0644 changetrack.conf $pkgdir/etc/changetrack.conf

}

# vim:set ts=2 sw=2 et:
md5sums=('6a0081cf5d385c0b1fb690507acd73a2')
