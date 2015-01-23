# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=dmdirc
pkgver=0.8.1
pkgrel=1
pkgdesc="A simple Java client for IRC"
arch=('i686' 'x86_64')
url="http://www.dmdirc.com/"
license=('BSD' 'MIT')
depends=('java-runtime>=6')
source=(https://github.com/DMDirc/DMDirc/releases/download/$pkgver/DMDirc-$pkgver.jar
        $pkgname.desktop $pkgname.launcher $pkgname.svg)
noextract=(DMDirc-$pkgver.jar)
sha256sums=('43b092c8fe362718298dd32a7f2f664a70dd9b6331f1d7f5f1e1e86ee005d245'
            '61878c3a225fecf408b3c802eb8c20f21691397c386daa702a3dc26923c67c4f'
            '5fafa34cd89711ddf0d7a0adc13a8846a2277f24ad7db8ed34913ef59c93431f'
            '6089615c400e6612384e2b6b21d88a27d810506017fd4556e1ace5ed316e7847')

package() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  bsdtar --strip=3 -xf DMDirc-$pkgver.jar \
    -C "$pkgdir/usr/share/licenses/$pkgname" com/$pkgname/licences/*
  install -Dm755 $pkgname.launcher "$pkgdir/usr/bin/$pkgname"
  install -Dm644 DMDirc-$pkgver.jar "$pkgdir/usr/share/java/$pkgname/DMDirc.jar"
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/java/$pkgname/icon.svg"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
