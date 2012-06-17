# Maintainer: mitsuse <mitsuset - gmail>
pkgname=cmecab
pkgver=2.0.1
pkgrel=1
pkgdesc="Yet Another Java Binding for MeCab"
arch=('i686' 'x86_64')
url="http://code.google.com/p/cmecab-java/"
license=('Public Domain')
groups=()
depends=("java-environment" "mecab")
makedepends=("apache-ant")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://cmecab-java.googlecode.com/files/cmecab-java-$pkgver-src.zip")
md5sums=('797ace94afa75f8e13eb87f72d2175c1')

build() {
  cd $srcdir/cmecab-java
  ant
}

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/java/cmecab
  install -d $pkgdir/usr/share/java/cmecab/lib
  install -d $pkgdir/usr/share/java/cmecab/lib/license
  install -d $pkgdir/usr/share/java/cmecab/etc
  install -d $pkgdir/usr/share/java/cmecab/etc/TinySegmenter

  install -m 644 cmecab-java/bin/cmecab-$pkgver.jar $pkgdir/usr/share/java/cmecab
  install -D -m 644 cmecab-java/lib/*.jar $pkgdir/usr/share/java/cmecab/lib
  install -D -m 644 cmecab-java/lib/license/*.txt $pkgdir/usr/share/java/cmecab/lib/license
  install -D -m 644 cmecab-java/etc//TinySegmenter/*.js $pkgdir/usr/share/java/cmecab/etc/TinySegmenter
}
