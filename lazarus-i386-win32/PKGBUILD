# Contributor: Jens Adam (byte/jra) <j_adam@web.de>
pkgname=lazarus-i386-win32
pkgver=1.4.0
pkgrel=1
pkgdesc="Lazarus Component Library (i386-win32)"
url="http://www.lazarus.freepascal.org"
license=("GPL2" "MPL" "custom:LGPL")
arch=(any)
depends=(fpc-i386-win32-rtl)
makedepends=(lazarus ppcross386)
options=(!emptydirs !makeflags !strip staticlibs)
source=("http://downloads.sourceforge.net/project/lazarus/Lazarus%20Zip%20_%20GZip/Lazarus%201.4/lazarus-$pkgver-0.tar.gz")
md5sums=('479c64ef40a327142f56e9378b7e8612')

build() {
  cd "$srcdir/lazarus"
  lazbuild --os=win32 --ws=win32 --cpu=i386  --lazarusdir=`pwd` lcl/lclbase.lpk
  lazbuild --os=win32 --ws=win32 --cpu=i386 lcl/interfaces/lcl.lpk
  #lazbuild --os=win32 --ws=qt --cpu=i386 lcl/lclbase.lpk
  #lazbuild --os=win32 --ws=qt --cpu=i386 lcl/interfaces/lcl.lpk
  #lazbuild --os=win32 --ws=gtk2 --cpu=i386 lcl/lclbase.lpk
  #lazbuild --os=win32 --ws=gtk2 --cpu=i386 lcl/interfaces/lcl.lpk
}

package() {
  cd "$srcdir/lazarus"
  mkdir -p "$pkgdir/usr/lib/lazarus"
  find . -type f -path *i386-win32* -exec cp --parents '{}' "$pkgdir/usr/lib/lazarus/" \;
  find $pkgdir -name '*.o' -o -name '*.a' | xargs i686-w64-mingw32-strip -g
}

