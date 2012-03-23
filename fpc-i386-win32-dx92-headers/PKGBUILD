pkgname=fpc-i386-win32-dx92-headers
pkgver=2007.04
pkgrel=3
pkgdesc="Minimal Free Pascal headers for DirectX 9.0, supports up to April 2007 update (i386-win32)"
arch=(any)
url="http://msdn.microsoft.com/directx/"
license=('unknown')
depends=('fpc-i386-win32-rtl')
makedepends=('ppcross386')
source=("http://www.clootie.ru/fpc/files/FPC_DirectX92.zip")
md5sums=('1faffde17a88df1c1f939eb71b2b28bb')
_fpcvers=`fpc -iV`

build() {
  cd ${srcdir}
  for file in `ls *.pas`
  do
    ppcross386 -Twin32 $file
  done
}

package() {
  cd ${srcdir}
  mkdir -p "$pkgdir/usr/lib/fpc/$_fpcvers/units/i386-win32/directx"
  cp {*.o,*.ppu,*.a,*.rst} "$pkgdir/usr/lib/fpc/$_fpcvers/units/i386-win32/directx"
}