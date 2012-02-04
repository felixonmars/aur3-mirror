#Maintainer: stalker_exe <senokosov8 @ mail . ru>
pkgname=bauerbill
pkgver=2011.03.10.1
pkgrel=1
pkgdesc="An extension of Powerpill that brings download acceleration, ABS, AUR, CPAN and Hackage support to Pacman, among other things."
depends=('aria2' 'perl' 'perl-xyne-arch>=1.0' 'perl-xyne-common' 'powerpill' 'perl-uri' 'perl-crypt-ssleay')
arch=('any')
license=('GPL')
backup=(etc/${pkgname}.conf)
url="http://xyne.archlinux.ca/old_projects/${pkgname}"
source=(http://xyne.archlinux.ca/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('4b24b6f1c86b16d118aa11622943bec0')

build() {
  install -D -m755 $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
  install -D -m644 $srcdir/$pkgname/man/$pkgname.1.gz $pkgdir/usr/share/man/man1/$pkgname.1.gz
  install -D -m644 $srcdir/$pkgname/$pkgname.conf $pkgdir/etc/$pkgname.conf
  install -D -m644 $srcdir/$pkgname/bash_completion $pkgdir/etc/bash_completion.d/$pkgname
}
# vim: set ts=2 sw=2 et:
