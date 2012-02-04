# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>
pkgname=pgtune
pkgver=0.9.3
pkgrel=1
pkgdesc="A tool to tune the config file for PostgreSQL"
arch=(any)
url="http://pgfoundry.org/projects/pgtune/"
license=('BSD')
depends=(python)
source=($pkgname-$pkgver.tar.gz::'http://pgfoundry.org/frs/download.php/2449/')
md5sums=('a765e0fc120bad2828167004b277f2d0')
build () {
  cd "$srcdir/$pkgname-$pkgver"
  sed -e s,/usr/bin/python,/usr/bin/python2,g -i pgtune
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  install -D -m 555 pgtune "$pkgdir/usr/bin/pgtune"
  mkdir -p "$pkgdir/usr/share/pgtune/settings/"
  cp pg_settings* "$pkgdir/usr/share/pgtune/settings/"
  install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo "build done!"
}

# vim:set ts=2 sw=2 et:
