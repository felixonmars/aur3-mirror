# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: xduugu
pkgname=java-jama
_pkgname=Jama
pkgver=1.0.3
pkgrel=1
pkgdesc="a basic linear algebra package for Java"
arch=('i686' 'x86_64')
url="http://math.nist.gov/javanumerics/jama/"
license=('custom')
depends=('java-runtime')
source=(http://math.nist.gov/javanumerics/$_pkgname/$_pkgname-$pkgver.jar
        LICENSE)
md5sums=('8f6ef6e39e60612a978c635ab2328cfc'
         '5abbc6ad79e886bfcaf07ab828c18c09')
noextract=("${_pkgname}-${pkgver}.jar")

build() {
  install -D -m 644 "$srcdir/$_pkgname-$pkgver.jar" \
    "$pkgdir/usr/share/java/$_pkgname/$_pkgname-$pkgver.jar" || return 1
  ln -s "$_pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar" || return 1

  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
}

# vim:set ts=2 sw=2 et:

