# Contributor: Jonathan Wiersma <archaur at jonw dot org>
# Maintainer: alyst <astukalov@gmail.com>
pkgname=eclipse-antlr-runtime
pkgver=3.2.0
pkgrel=1
pkgdesc="Support for antlr parser generator in Eclipse"
arch=('i686' 'x86_64')
url="http://antlreclipse.sourceforge.net/"
license=('EPL')
depends=("eclipse>=3.7")
noextract=($pkgname-$pkgver.jar)
source=("$pkgname-$pkgver.jar::http://www.eclipse.org/downloads/download.php?r=1&file=/tools/orbit/downloads/drops/R20120526062928/repository/plugins/org.antlr.runtime_3.2.0.v201101311130.jar")
md5sums=('95ba92965205c0536c71d32ee083e8b9')

build() {
install -d $pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins || return 1
install -m644 $srcdir/$pkgname-$pkgver.jar \
	$pkgdir/usr/share/eclipse/dropins/${pkgname#eclipse-}/eclipse/plugins || return 1
}
