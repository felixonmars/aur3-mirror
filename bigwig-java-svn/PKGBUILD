# Maintainer: Mike Dacre <mike@dacre.me>
pkgname=bigwig-java-svn
pkgver=r39
pkgrel=1
pkgdesc="Java readers for UCSC's BigWig format"
arch=('any')
url="https://code.google.com/p/bigwig/"
license=('GPL')
depends=('java-environment')
makedepends=('apache-ant' 'subversion')
provides=("${pkgname%-svn}")
conflicts=("${pkgname%-svn}")
source=('bigwig-java::svn+http://bigwig.googlecode.com/svn/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-svn}"

# Subversion
  printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
  cd "$srcdir/${pkgname%-svn}"
  JAVA_HOME=/usr/lib/jvm/default ant
}

package() {
  mkdir -p "$pkgdir/usr/share/java/bigwig"
  install -m644 "$srcdir/${pkgname%-svn}/dist/BigWig.jar" "$pkgdir/usr/share/java/bigwig"
}
