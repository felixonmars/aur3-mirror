# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor : Aaron Griffin <aaron@archlinux.org>

pkgname=bootchart
pkgver=0.9
pkgrel=9
pkgdesc="Boot Process Performance Visualization"
url="http://www.bootchart.org/"
arch=('any')
license=('GPL2')
depends=('acct' 'sh')
makedepends=('apache-ant' 'java-environment>=6')
optdepends=('java-runtime>=6: for bootchart-render')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2"
        "$pkgname-render"
        "fix-inittab-regex.patch")
md5sums=('4be91177d19069e21beeb106f2f77dff'
         '19e785b10f27b264e2f033a5548307b9'
         'c8a70f1f763a2632dc7759a6387f865f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #FS#8438 - fix the regex used to scan inittab for archlinux
  patch -up1 < ../fix-inittab-regex.patch

  # Build Jar
  /usr/share/java/apache-ant/bin/ant jar
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir"/{etc,sbin,usr/{bin,share/$pkgname}}

  install -Dm755 script/${pkgname}d "$pkgdir/sbin"
  install -Dm644 script/${pkgname}d.conf "$pkgdir/etc"
  install -Dm755 ../${pkgname}-render "$pkgdir/usr/bin"
  install -Dm644 ${pkgname}.jar "$pkgdir/usr/share/$pkgname"
}
