# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=torrtux
pkgver=1.1.5
pkgrel=1
pkgdesc="Terminal-based program, written in perl for searching torrents from The Pirate Bay."
arch=('any')
url="http://sourceforge.net/projects/torrtux/"
license=('GPL3')
depends=('perl-appconfig' 'perl-libwww' 'perl-perlio-gzip' 'perl-switch' 'perl-xml-rpc' 'xclip')
optdepends=('perl-lwp-protocol-https: https support for some proxies')
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b6ecdc5dd0afd1952b4bde5c77c63e9b')
install=$pkgname.install

package() {
   cd $srcdir/$pkgname-$pkgver

   # Config file for choosing torrent client
   install -Dm755 .torrtuxrc $pkgdir/usr/share/doc/torrtux/.torrtuxrc

   # Man page
   install -Dm644 torrtux.1.gz $pkgdir/usr/share/man/man1/torrtux.1.gz

   # Program directory
   rm  install.pl torrtux.1.gz
   mkdir $pkgdir/usr/share/$pkgname
   cp * $pkgdir/usr/share/$pkgname

   # Symlink
   mkdir -p $pkgdir/usr/bin
   ln -s  "/usr/share/torrtux/torrtux" "$pkgdir/usr/bin/torrtux"
}