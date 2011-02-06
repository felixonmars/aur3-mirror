# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
pkgname=protege-core
_realname=protege
pkgver=3.3.1
pkgrel=1
pkgdesc="Free, open source ontology editor and knowledge-base framework - core"
arch=('i686' 'x86_64')
url="http://protege.stanford.edu/"
license=('MPL')
conflicts=(protege)
depends=(java-runtime)
makedepends=(java-environment apache-ant javacc)
source=(http://$_realname.stanford.edu/download/release/$_realname-src-$pkgver.zip
        local.properties $_realname.sh)
md5sums=('8dde955bd290af7bec3bf89a4fcd2327'
         'e18d69e0947e2ad2663b9fb26cd41228'
         '085ca5896c22a23ae43aeb39229fdb74')
build() {
  cd "$srcdir/Protege $pkgver"
  cp "$srcdir/local.properties" .
  ant jar || return 1
  install -D "dist/$_realname.jar" "$pkgdir/usr/share/java/$_realname/$_realname.jar"
  install -d "$pkgdir/usr/share/java/$_realname/plugins"
  cp -r lib/* "$pkgdir/usr/share/java/$_realname"
  install -Dm755 "$srcdir/$_realname.sh" "$pkgdir/usr/bin/$_realname"
}
