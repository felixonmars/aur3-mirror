# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=vcs2ics
pkgver=1
pkgrel=1
pkgdesc="A script to convert MS Outlook .vcs calendar appointments into .ics iCalendar format, that can be read by Evolution."
arch=('any')
url="http://linux.netpimpz.com/outlook/"
license=('unknown')
depends=('perl')
source=(http://linux.netpimpz.com/outlook/$pkgname)

package() {
  install -D $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
md5sums=('198604ba47b654ab734f27507bf74c74')
