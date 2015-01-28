# Maintainer: Mike Dacre <mike@dacre.me>
pkgname=htsjdk-git
pkgver=1.128
pkgrel=1
pkgdesc="A Java API for high-throughput sequencing data (HTS) formats (requires jre7)"
arch=('any')
url="https://github.com/samtools/htsjdk/"
license=('GPL')
depends=('jdk6')
makedepends=('git' 'apache-ant')
provides=("${pkgname}")
install=
source=('htsjdk::git+https://github.com/samtools/htsjdk.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  JAVA_HOME="/usr/lib/jvm/java-6-jdk/"
  JAVA6_HOME="/usr/lib/jvm/java-6-jdk/"
  cd "$srcdir/${pkgname%-git}"
  /usr/bin/ant -Djava6.home=/usr/lib/jvm/java-6-jdk/ htsjdk-jar
}

package() {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p "$pkgdir/usr/share/java/htsjdk"

  for name in dist/*.jar ; do
    install -m644 $name "$pkgdir/usr/share/java/htsjdk/"
  done
}
