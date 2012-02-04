# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=ohrrpgce-svn
pkgver=4085
pkgrel=1
pkgdesc="Official Hamster Republic Role Playing Game Construction Engine"
arch=(i686 x86_64)
url="http://hamsterrepublic.com/ohrrpgce/Main_Page.html"
license=('GPL')
if [ "$CARCH" = "x86_64" ]; then
depends=('lib32-sdl' 'lib32-sdl_mixer' 'lib32-libxpm' 'timidity++' 'euphoria3' )
makedepends=('gcc-multilib')
else
depends=('sdl' 'sdl_mixer' 'timidity++' 'euphoria3' 'libxpm')
fi
makedepends=('subversion' 'freebasic')
conflicts=('ohrrpgce')
provides=('ohrrpgce')
source=()
_svntrunk=svn://gilgamesh.HamsterRepublic.com/ohrrpgce/wip
_svnmod=ohrrpgce

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  if [ "$CARCH" = "x86_64" ]; then
  sed 's|gcc|gcc -m32|g' -i makeedit.sh
  sed 's|gcc|gcc -m32|g' -i makegame.sh
  fi
  ./makeedit.sh
  ./makegame.sh
  ./makeutil.sh
  sed 's|hspeak.exw|/usr/share/ohrrpgce/hspeak.exw|g' -i hspeak.sh
}

package() {
  cd "$srcdir/$_svnmod-build"

  mv ohrrpgce-custom ohrrpgce-custom.bin
  echo -e "#!/bin/sh\ncd /usr/share/ohrrpgce\nexec ./ohrrpgce-custom.bin \"\${@}\""\
	> ohrrpgce-custom && chmod +x ohrrpgce-custom
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/ohrrpgce/"
  mkdir -p "${pkgdir}/usr/share/doc/ohrrpgce/"

  cp ohrrpgce-{game,custom} {re,un}lump "${pkgdir}/usr/bin/"
  cp hspeak.sh hsspiffy.e ohrrpgce-custom.bin "${pkgdir}/usr/share/ohrrpgce/"
  cp ohrrpgce.new plotscr.hsd scancode.hsi "${pkgdir}/usr/share/ohrrpgce/"
  cp -r import "${pkgdir}/usr/share/ohrrpgce/"
  cp -r docs "${pkgdir}/usr/share/doc/ohrrpgce/"
  cp -r ohrhelp "${pkgdir}/usr/share/doc/ohrrpgce/"
}

# vim:set ts=2 sw=2 et:
