# Maintainer: Tetsumi <tetsumi@vmail.me>

pkgname=golo
pkgver=2.1.0
pkgrel=1
pkgdesc="A lightweight dynamic language for the JVM."
arch=(any)
url="http://golo-lang.org/"
license=(APACHE)
depends=(java-runtime-headless bash)
options=(!strip)
noextract=("golo-${pkgver}-distribution.tar.gz")
source=(https://repo1.maven.org/maven2/org/golo-lang/golo/$pkgver/golo-${pkgver}-distribution.tar.gz)
md5sums=('de3ed04348d45999ec366fcb79a37f92')

package() {
  cd "$pkgdir"

  mkdir opt
  bsdtar -C opt -xf "$srcdir/golo-${pkgver}-distribution.tar.gz"
  mv opt/golo-$pkgver opt/golo
  
  find opt/golo -regextype posix-extended -regex '.*\.(bat|dll|exe)' -delete

  mkdir -p usr/bin
  
  ln -s ../../opt/golo/bin/golo usr/bin/golo
  ln -s ../../opt/golo/bin/vanilla-golo usr/bin/vanilla-golo

  mkdir -p usr/share/licenses/$pkgname
  ln -s ../../../../opt/golo/LICENSE usr/share/licenses/$pkgname/LICENSE
}
 
