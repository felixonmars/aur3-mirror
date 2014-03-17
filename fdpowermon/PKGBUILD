# Author: matze5800 <matze5800@gmail.com>

pkgname=fdpowermon
pkgver=1.12
pkgrel=1
pkgdesc="A perl script to display the battery level, status and remaining time in the toolbar"
arch=('any')
license=(custom)
url="http://packages.qa.debian.org/f/fdpowermon.html"
depends=('gtk2-perl' 'acpi' 'perl-gtk2-notify')
source=('http://ftp.debian.org/debian/pool/main/f/fdpowermon/fdpowermon_1.12.tar.xz')
sha256sums=('95b5b1e29ebfc248a47e6c674a6ce8eb6cab5351f3093bf6ae2a086756440b32')

package() {
  cd $srcdir/$pkgname/
  mkdir -p $pkgdir/etc/fdpowermon
  cp theme.cfg $pkgdir/etc/fdpowermon
  cp theme.pl $pkgdir/etc/fdpowermon
  mkdir -p $pkgdir/usr/bin
  cp fdpowermon $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/icons/oxygen/22x22/status
  cp -r icons/*.png $pkgdir/usr/share/icons/oxygen/22x22/status
  install -D -m644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
