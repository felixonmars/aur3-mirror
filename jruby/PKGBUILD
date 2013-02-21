# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: FaziBear <fazibear@gmail.com>

pkgname=jruby
pkgver=1.7.3
pkgrel=1
pkgdesc="100% pure-Java implementation of the Ruby programming language"
arch=(any)
url="http://www.jruby.org/"
license=(CPL GPL2 LGPL2.1 custom)
depends=(java-runtime)
options=(!strip)
source=("http://$pkgname.org.s3.amazonaws.com/downloads/$pkgver/$pkgname-bin-$pkgver.tar.gz")
sha256sums=('7809456743e058dc27e650ec62e5b527f51c65f3c5df7ddd3ad7296c74d3e35d')

if false; then
makedepends=(java-environment apache-ant)
build() {
  cd jruby
  ant dist-bin
  tar -C .. -xf dist/$pkgname-bin-$pkgver.tar.gz
}
fi

package() {
  cd "$pkgdir"

  mkdir opt
  cp -r "$srcdir/jruby-$pkgver" opt/jruby

  mkdir -p usr/bin
  for _file in jirb{,_swing} jruby{,c} jgem; do
    ln -s ../../opt/jruby/bin/$_file usr/bin/$_file
  done

  mkdir -p usr/share/licenses/$pkgname
  ln -s ../../../../opt/jruby/COPYING \
    usr/share/licenses/$pkgname/COPYING
}
