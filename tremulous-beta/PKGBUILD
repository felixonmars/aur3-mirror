# This is a working PKGBUILD for the Tremulous gameplay preview.
# 
# Have fun playing!

# Maintainer: Jonas Jelten <jonas.jelten@in.tum.de>
pkgname=tremulous-beta
pkgver=1.2
pkgrel=3
epoch=
pkgdesc="Gameplay Preview version of Tremulous."
arch=('i686' 'x86_64')
url="http://tremulous.net/"
license=('GPL' 'CC')
groups=()
depends=('mesa' 'sdl' 'openal>=1.7.411' 'libgl' "tremulous-data" "freetype2")
makedepends=('gcc' 'pv' 'gzip' 'tar')
checkdepends=()
optdepends=('lyx')
provides=(tremulous-gpp)
conflicts=(tremulous-gpp)
replaces=()
backup=()
options=()


install=
changelog=

source=(tremulous-gpp1.zip::"http://prdownloads.sourceforge.net/tremulous/tremulous-gpp1.zip?download")

noextract=()
#generate with 'makepkg -g' :
md5sums=('70a32d6e587e4ac67bdfd0be7d6edc2f')

#extracting the zip creates the following folder:
zipname='tremulous'

build() {
  cd "$srcdir/$zipname"
  gzip -dc tremulous-gpp1-src.tar.gz | pv | tar x
  cd "tremulous-ggp1-src"

  mkdir -p "$srcdir/tremulous-gpp-build"

  make BUILD_DIR="$srcdir/tremulous-gpp-build"

}

package() {
  COMPILE_PLATFORM=$(uname | sed -e s/_.*// | tr '[:upper:]' '[:lower:]')
  COMPILE_ARCH=$(uname -m | sed -e s/i.86/x86/)
  cd "$srcdir/tremulous-gpp-build/release-$COMPILE_PLATFORM-$COMPILE_ARCH/"

  mkdir -p "$pkgdir/opt/tremulous/"
  # License
  install -Dm644 "$srcdir/$zipname/tremulous-ggp1-src/GPL" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$srcdir/$zipname/tremulous-ggp1-src/CC" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CC"

  msg "Now moving the compiled stuff to the package directory"

  destdir=$pkgdir/opt/tremulous

  cp tremded.$COMPILE_ARCH $destdir/tremded-gpp
  cp tremulous.$COMPILE_ARCH $destdir/tremulous-gpp
  cp -R $srcdir/$zipname/gpp $destdir
  cp -R $srcdir/$zipname/tremulous-ggp1-src/assets $destdir/gpp

  install -D -m644 $srcdir/$zipname/tremulous-ggp1-src/misc/tremulous.xpm $pkgdir/usr/share/pixmaps/tremulous-gpp.xpm
  install -D -m644 $srcdir/$zipname/tremulous-ggp1-src/misc/server.cfg $destdir
  install -D -m644 $srcdir/$zipname/tremulous-ggp1-src/misc/manual.lyx $pkgdir/usr/share/tremulous/manual.lyx
  install -d -m755 $pkgdir/usr/bin
  echo "#!/bin/bash" > ${pkgdir}/usr/bin/tremulous-gpp
  echo "/opt/tremulous/tremulous-gpp $*" >> ${pkgdir}/usr/bin/tremulous-gpp

  echo "#!/bin/bash" > ${pkgdir}/usr/bin/tremded-gpp
  echo "/opt/tremulous/tremded-gpp $*" >> ${pkgdir}/usr/bin/tremded-gpp
  chmod 755 ${pkgdir}/usr/bin/tremulous-gpp
  chmod 755 ${pkgdir}/usr/bin/tremded-gpp
}
