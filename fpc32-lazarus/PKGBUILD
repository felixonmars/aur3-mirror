pkgname=fpc32-lazarus
pkgver=1.4.0
pkgrel=1
pkgdesc="Lazarus Component Library for multilib"
url="http://www.lazarus.freepascal.org"
license=("GPL2" "MPL" "custom:LGPL")
arch=(x86_64)
depends=(lazarus)
makedepends=(fpc-multilib lib32-qt4pas lib32-gtk2)
options=(!emptydirs !makeflags staticlibs)
optdepends=("lib32-qt4pas: Lazarus Qt GUI backend"
"lib32-gtk2: Lazarus GTK2 GUI backend")
source=("http://downloads.sourceforge.net/project/lazarus/Lazarus%20Zip%20_%20GZip/Lazarus%201.4/lazarus-$pkgver-0.tar.gz")
md5sums=('479c64ef40a327142f56e9378b7e8612')

build() {
  cd "$srcdir/lazarus"
  lazbuild --os=linux --ws=gtk2 --cpu=i386 --lazarusdir=`pwd` lcl/lclbase.lpk
  lazbuild --os=linux --ws=gtk2 --cpu=i386 lcl/interfaces/lcl.lpk
  lazbuild --os=linux --ws=qt --cpu=i386 --lazarusdir=`pwd` lcl/lclbase.lpk
  lazbuild --os=linux --ws=qt --cpu=i386 lcl/interfaces/lcl.lpk
}

package() {
  cd "$srcdir/lazarus"
  mkdir -p "$pkgdir/usr/lib/lazarus"
  find . -type f -path *i386-linux* -exec cp --parents '{}' "$pkgdir/usr/lib/lazarus/" \;
}

