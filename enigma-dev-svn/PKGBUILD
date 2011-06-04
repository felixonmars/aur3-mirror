# Maintainer: RetroX <classixretrox@gmail.com>
pkgname=enigma-dev-svn
pkgver=758
pkgrel=1
pkgdesc="An open-source alternative to YoYoGame's Game Maker, written in C++."
pkglongdesc="ENIGMA Development Environment

An open-source alternative to YoYoGame's Game Maker, written in C++."
pkgdebsection="devel"
arch=('i386' 'i486' 'i586' 'i686' 'x86_64' 'amd64')
url="http://enigma-dev.org"
license=('GPL')
depends=('libgl' 'libx11' 'mesa' 'zlib' 'openal' 'gcc' 'make' 'java-runtime>=6' 'gtk2' 'lateralgm')
debdepends=('libgl1-mesa-dev' 'libglu1-mesa-dev ' 'libx11-dev' 'libz-dev' 'libopenal-dev' 'libgtk2.0-dev' 'gcc' 'g++' 'make' 'java-common' 'lateralgm')
makedepends=('subversion')
provides=('enigma-dev')
source=()
md5sums=()
_svntrunk="https://enigma-dev.svn.sourceforge.net/svnroot/enigma-dev/trunk"
_svnmod="enigma-dev"
install="enigma.install"
debpreinst="enigma.preinst"
debpostinst="enigma.postinst"
debpostrm="enigma.postrm"
lzmpostinst="enigma.postinst"
export PKGARCH="$PKGARCH"

build()
{
  cd $srcdir
  svn co $_svntrunk $_svnmod

  mkdir -p $pkgdir/opt/enigma

  cp -r $srcdir/$_svnmod -T $pkgdir/opt/enigma

  mv $pkgdir/opt/enigma/LinuxExtra/usr $pkgdir/usr
  rm -rf $pkgdir/opt/enigma/LinuxExtra

  # ecj . -source 1.6 -classpath /usr/share/java/jna/jna.jar:/usr/share/java/lateralgm/lateralgm.jar:/usr/share/java/svnkit/svnkit.jar && echo

  chmod -R 755 $pkgdir/opt $pkgdir/usr
  chmod -R 777 $pkgdir/opt/enigma
  find $pkgdir/usr -type f -exec chmod 644 {} \;
  rm $pkgdir/opt/enigma/lgm*.jar

  cd $pkgdir/opt/enigma

  compile_flags=''
  if [[ "$PKGARCH" == "i386" || "$PKGARCH" == "i486" || "$PKGARCH" == "i586" || "$PKGARCH" == "i686" ]]; then
    compileflags='-m32 -mtune=generic'
  elif [[ "$PKGARCH" == "amd64" || "$PKGARCH" == "x86_64" ]]; then
    compileflags='-m64 -mtune=generic'
  fi

  make MISCFLAGS="$compileflags" -C CompilerSource

  cd $pkgdir/opt/enigma

  for make_GMODE in {Run,Debug,Build,Release}; do
    for make_dir in {Audio_Systems/*,Graphics_Systems/*}; do
      if [[ -d "$make_dir" && -f "$make_dir/Config/xlib.ey" ]]; then
        make $make_GMODE MODE="$make_GMODE" MISCFLAGS="$compileflags" -C ENIGMAsystem/SHELL/$make_dir
      fi
    done
    for make_dir in {Collision_Systems/*,Universal_System,Platforms/xlib}; do
      if [[ -f "$make_dir/Makefile" ]]; then
        make $make_GMODE MODE="$make_GMODE" MISCFLAGS="$compileflags" -C ENIGMAsystem/SHELL/$make_dir
      fi
    done
  done
}

package()
{
  rm -rf $pkgdir/opt/enigma/{Autoconf,CompilerSource,pluginsource,MacOS}
  find $pkgdir -name "*.svn" -exec rm -rf {} \; 2> /dev/null || true
}
