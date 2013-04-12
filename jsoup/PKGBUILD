# Contributor: Joel Sevilleja Febrer Joel7987@gmail.com
# Maintainer: Ben Eggers <ben.eggers36@gmail.com>

pkgname=jsoup
pkgver=1.7.2
pkgrel=1
pkgdesc="An HTML parser for Java"
arch=('any')
url="http://jsoup.org/"
license="MIT"
depends=('java-runtime')
conflicts=('postgresql-jdbc3')
source=(http://jsoup.org/packages/jsoup-${pkgver}.jar \
	http://jsoup.org/packages/jsoup-${pkgver}-javadoc.jar \
	http://jsoup.org/packages/jsoup-${pkgver}-sources.jar )
noextract=('*.jar')

package() {
	mkdir -p $pkgdir/usr/share/java/$pkgname
	cp $srcdir/*.jar $pkgdir/usr/share/java/$pkgname
}


md5sums=('1e9f8ab89deb373dcc90449ff366f006' \
	 '4573f9de7b274b8c1c18f98217a9abdb' \
	 '1eb4253d329b285cf44f6955f303c58b')