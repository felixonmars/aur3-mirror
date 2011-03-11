#pymol PKGBUILD
#Maintainter: Cuneyt Unlu <unlucu@gmail.com>
pkgname=gabedit-new
pkgver=2.3.6
pkgrel=1
pkgdesc="Gabedit is a graphical user interface to computational chemistry packages like Gamess-US, Gaussian, Molcas, Molpro, MPQC, OpenMopac, PCGamess and Q-Chem "
arch=('i686' 'x86_64')
url="http://gabedit.sourceforge.net/"
license=('Custom')
depends=('gtk')
makedepends=()
provides=(gabedit)
conflicts=(gabedit)
replaces=(gabedit)
_pkgver=236
source=(http://prdownloads.sourceforge.net/gabedit/GabeditSrc$_pkgver.tar.gz)
md5sums=('f75d7e2c683de4c5b10de9aebdbb9a5f')

build() {

 mkdir $startdir/pkg/usr
 mkdir $startdir/pkg/usr/bin
 mkdir $startdir/pkg/usr/share
 mkdir $startdir/pkg/usr/share/licenses
 mkdir $startdir/pkg/usr/share/licenses/gabedit
 cd $startdir/src/GabeditSrc$_pkgver/
 make 
 install -D -m655 $startdir/src/GabeditSrc$_pkgver/gabedit $startdir/pkg/usr/bin/
}

