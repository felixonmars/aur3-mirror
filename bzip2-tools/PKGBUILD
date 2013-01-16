# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Christoph Zeiler <rabyte__gmail>
# Contributor: Judd <jvinet@zeroflux.org>

pkgname=bzip2-tools
pkgver=1.0.6
pkgrel=1
pkgdesc="Supplementary wrappers for bzip2 (bzdiff, bzgrep, and bzmore)"
arch=('any')
license=('custom')
url="http://sources.redhat.com/bzip2/"
depends=('bash' 'bzip2')
source=(http://www.bzip.org/$pkgver/bzip2-$pkgver.tar.gz)
md5sums=('00b516f4704d4a7cb50a1d97e6e8e15b')

package() {
  cd "$srcdir/bzip2-$pkgver"

  install -Dm755 bzdiff "$pkgdir/usr/bin/bzdiff"
  install -Dm755 bzgrep "$pkgdir/usr/bin/bzgrep"
  install -Dm755 bzmore "$pkgdir/usr/bin/bzmore"

  install -Dm644 bzdiff.1 "$pkgdir/usr/bin/bzdiff.1"
  install -Dm644 bzgrep.1 "$pkgdir/usr/bin/bzgrep.1"
  install -Dm644 bzmore.1 "$pkgdir/usr/bin/bzmore.1"

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
