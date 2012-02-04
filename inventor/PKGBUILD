# Contributor: marcus fritzsch <fritschy@googlemail.com>

pkgname=inventor
pkgver=2.1.5.10
pkgrel=1
pkgdesc="Open Inventor(TM) is an object-oriented 3D toolkit offering a comprehensive solution to interactive graphics programming problems."
url="http://oss.sgi.com/projects/inventor/"
license="GPL"
depends=('libjpeg' 'libxi' 'mesa' 'lesstif')
makedepends=('tcsh')
conflicts=('coin')
replaces=('coin')
backup=()
install=
source=("ftp://oss.sgi.com/projects/inventor/download/$pkgname-2.1.5-10.src.tar.gz"
'00_freetype.patch' '01_SoPath.patch' '02_SoCalcParse.patch' '03_ivcommondefs.patch'
'05_freetype.patch' '06_makeManDirs.patch' '07_glw.patch' '08_linkage.patch')
md5sums=('82208096f1e0b111160e864e239c3a51' 'efd0472a4c40117ce389f2581bcf73a9'
'394563e05cee6c6a14e04dfd84bc43ff' '04cf5538a9987f72c4d7338a6a2245f7'
'0ba7ba3d4b117cc2c407d77d0ac3cc63' '8937d031b1db3b401b676353d170a76f'
'5c5aee526bac4c71833070503fd098f5' 'a6476c2419cd27c289b25bd2f1ed703f'
'9239e5383757d20bf8073ad15406aafc')

build() {
  cd $startdir/src/$pkgname

  unset LS_COLORS # csh tends to exit when this one is 'ugly'

  # lots of small patches...
  patch -p1 < $startdir/00_freetype.patch
  patch -p1 < $startdir/01_SoPath.patch
  patch -p1 < $startdir/02_SoCalcParse.patch
  patch -p1 < $startdir/03_ivcommondefs.patch
  patch -p1 < $startdir/05_freetype.patch
  patch -p1 < $startdir/06_makeManDirs.patch
  patch -p1 < $startdir/07_glw.patch
  patch -p1 < $startdir/08_linkage.patch

  export IVROOT="$startdir/pkg"
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":$IVROOT/usr/lib
  export FREETYPE=1
  export LLDLIBS="-lInventor -lInventorXt"
  make DESTDIR=$startdir/pkg install || return 1
  unset IVROOT FREETYPE LLDLIBS

  # cleanup installation
  cd $startdir/pkg/usr/share
  mkdir -m 755 Inventor
  mv ../demos Inventor/
  mv data help Inventor/
}
