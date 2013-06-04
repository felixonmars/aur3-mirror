# Maintainer: Vianney le Clément <vleclement AT gmail · com>
# Based on jdk6 by Ethan Hall, Guillaume ALAUX, Daniel J Griffiths, Jason Chu,
#                  Geoffroy Carrier, Thomas Dziedzic, Dan Serban
pkgname=sun-java6
_update=45
_build=b06
pkgver=6u$_update
pkgrel=1
pkgdesc="Java 6 Development Kit and Runtime Environment without system integration"
url=http://www.oracle.com/technetwork/java/javase/downloads/index.html
arch=(i686 x86_64)
license=(custom)
depends=(glibc)
install=sun-java6.install
_arch=i586
[ "$CARCH" = 'x86_64' ] && _arch=x64
source=("http://download.oracle.com/otn-pub/java/jdk/$pkgver-$_build/jdk-$pkgver-linux-$_arch.bin"
        envsetup.sh)
noextract=("jdk-$pkgver-linux-$_arch.bin")
md5sums=('3269370b7c34e6cbfed8785d3d0c5cbd'
         'a68a8dd9cb24e9e0f2b2e8e4127d5140')
[ "$CARCH" = 'x86_64' ] && md5sums[0]='40c1a87563c5c6a90a0ed6994615befe'
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --header "Cookie:oraclelicensejdk-${pkgver}-oth-JPR=accept-securebackup-cookie;gpw_e24=http://edelivery.oracle.com"')
#PKGEXT=.pkg.tar

prepare() {
  cd "$srcdir"
  rm -rf jdk1.6.0_$_update
  sh "jdk-$pkgver-linux-$_arch.bin" -noregister
  # Removing the following files as they contain references to $srcdir.
  rm -f jdk1.6.0_$_update/register*.html
  rm -f jdk1.6.0_$_update/jre/lib/servicetag/registration.xml
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/opt"
  cp -drT jdk1.6.0_$_update "$pkgdir/opt/$pkgname"

  install envsetup.sh "$pkgdir/opt/$pkgname/envsetup.sh"

  install -Dm644 "$pkgdir/opt/$pkgname/COPYRIGHT" "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
  install -Dm644 "$pkgdir/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
