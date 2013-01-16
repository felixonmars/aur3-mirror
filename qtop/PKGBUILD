# Maintainer: TDY <tdy@archlinux.info>

pkgname=qtop
pkgver=53
pkgrel=1
pkgdesc="A monitoring tool for Torque and PBS-based cluster systems"
arch=('any')
url="http://fotis.web.cern.ch/fotis/QTOP/"
depends=('qstat')
license=('GPL')
source=($pkgname-$pkgver.tgz::https://fotis.web.cern.ch/fotis/QTOP/$pkgname.tar.gz)
md5sums=('d11f95dfe7da54eea80f781ee4cae5af')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # etc
  install -Dm644 $pkgname.colormap "$pkgdir/etc/$pkgname.colormap"
  install -Dm644 $pkgname.conf "$pkgdir/etc/$pkgname.conf"

  # bin
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

  # doc
  install -Dm644 $pkgname.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"

  # extras
  install -Dm644 EXTRAS "$pkgdir/usr/share/doc/$pkgname/EXTRAS"
  install -Dm755 ansi2html.sh "$pkgdir/usr/share/$pkgname/ansi2html.sh"
  install -Dm755 qtop4cron "$pkgdir/usr/share/$pkgname/qtop4cron"
  install -Dm755 qtop4oar "$pkgdir/usr/share/$pkgname/qtop4oar"
}

# vim:set ts=2 sw=2 et:
