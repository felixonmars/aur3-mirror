# Maintainer: kevku <kevku@gmx.com>
pkgname=java-pkcs11wrapper
pkgver=1.3
pkgrel=2
pkgdesc="Estonian ID-card pkcs11 java plugin"
arch=('x86_64' 'i686')
_arch='linux64'
[ "$CARCH" = "i686" ] && _arch='linux'
url="http://ideelabor.ee/opensource/wiki/IdKaardiTarkvara/DigiallkiriVeebisLinuxiga"
license=('custom:Apache')
depends=('opensc>=0.12.0' 'jre')
source=("http://ideelabor.ee/downloads/pkcs11wrapper-$_arch.tar.gz"
	"LICENSE")
md5sums=('f5530cc60cd4e576d90afe394e0999d6')
[ "$CARCH" = "i686" ] && md5sums=('b2928468faf8088a49a38c583a8b9119')
_javaarch='amd64'
[ "$CARCH" = "i686" ] && _javaarch='i386'
md5sums+=('72268f58cf2c84624ae4d03f873b4736')

package() {
  cd "$srcdir"
  install -D "libpkcs11wrapper${_arch#linux}.so" "$pkgdir/opt/java/jre/lib/$_javaarch/libpkcs11wrapper.so"
  install -D "LICENSE" "$pkgdir/usr/share/licenses/java-pkcs11wrapper/LICENSE"
  install -dm755 "${pkgdir}/usr/lib"
  ln -sf "/usr/lib/opensc-pkcs11.so" "$pkgdir/usr/lib/libopensc-pkcs11.so" # seda kasutavad Hansapank ja DigiDoci portaal
  ln -sf "/usr/lib/opensc-pkcs11.so" "$pkgdir/usr/lib/libesteid-pkcs11.so" # seda kasutab SEB ühispank
}

