# Contributor: Anders Bergh <anders1@gmail.com>
pkgname=slncrypto
pkgver=1.1
pkgrel=1
pkgdesc="Selene database crypto Lua library"
arch=('i686' 'x86_64')
url="http://luaforge.net/projects/sln/"
license=('custom')
depends=(lua)
# LuaForge urls have to be updated manually (the ID is different)
source=(http://luaforge.net/frs/download.php/1692/slncrypto-1.1.tar.bz2
        license.txt)
md5sums=('4709bffa83fbd03eeca4174f1a009bb4'
         '4f35b971b46468d4918ba5f466db6782')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || return 1
  gcc -fPIC -shared $CFLAGS slncrypt.c -o crypto.so || return 1
  install -Dm755 crypto.so "${pkgdir}/usr/lib/lua/5.1/crypto.so" || return 1
  install -Dm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/slncrypto/LICENSE"
}
