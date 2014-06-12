# Contributor: Otakar Haška <ota.haska@seznam.cz>

pkgname=delaboratory-svn
_pkgname=delaboratory
pkgver=1251
pkgrel=1
pkgdesc="A realtime color correction utility to modify color/contrast of your photo using curves, mixer and blending in different colorspaces."
arch=('i686' 'x86_64')
url="http://code.google.com/p/delaboratory/"
license=('GPL3')
depends=('wxgtk')
makedepends=('subversion' 'awk')
source=($pkgname::svn+http://delaboratory.googlecode.com/svn/trunk "$pkgname.desktop")
conflicts=('delaboratory')
#_svnmod="delaboratory-read-only"

pkgver(){
    echo $(svnversion "$SRCDEST"/$pkgname/)
}

build() {
  cd "$pkgname/"
  sed -i 's/-Ofast/-O3/g' Makefile
if [ "$CARCH" = "x86_64" ];
then
  sed -i 's/OPTFLAGS=-march=i686/#OPTFLAGS=-march=i686/g' Makefile
  sed -i 's/#OPTFLAGS=-march=core2/OPTFLAGS=-march=native/g' Makefile
fi
  make || return 1
}


package() {
  # bin
  install -Dm755 $pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"

  # desktop file
  desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
}

md5sums=('SKIP'
         '3958f2241b760f208236f5309355381b')
