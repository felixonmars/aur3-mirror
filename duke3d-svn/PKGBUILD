# Contributor: erm67
arch=(i686)
pkgname=duke3d-svn
pkgver=187
pkgrel=2
pkgdesc="Icculus.org port of the famous 3d Realms game. This will checkout and package the latest SVN version."
url="http://icculus.org/projects/duke3d/"
license='GPL'

depends=('sdl' 'sdl_mixer')
makedepends=('subversion')
conflicts=()
provides=()
install=('duke3d-svn.install')

source=(duke3d-svn.png \
	duke3d-svn.desktop \
	helper.sh)
md5sums=('820c00ce7a34f7b4495163dedb06ee8e' 'c10aba109900e33ca66949c296ec94cd' \
         'f9395546b2edbfca31c799345d7c4cf5')

_svntrunk=svn://svn.icculus.org/duke3d/
_svnmod=duke3d

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r duke3d/trunk/source/ $_svnmod-build
  cd $startdir/src/$_svnmod-build
  # fix compiler flags
  sed -i -e 's|-O3|-O3 -march=i686 -mtune=generic|' Makefile
  sed -i -e 's|-O3|-O3 -march=i686 -mtune=generic|' buildengine/Makefile
  sed -i -e 's|-g||g' Makefile
  sed -i -e 's|-g||g' buildengine/Makefile
 unset CFLAGS
 unset LDFLAGS
  make || return 1
  mkdir -p $startdir/pkg/usr/share/{applications,pixmaps,$pkgname}
  install -m755 -D duke3d $startdir/pkg/usr/share/$pkgname/$pkgname-bin
  cp $startdir/helper.sh duke3d.sh
  sed -i -e "s|GAMEDIR|/usr/share/$pkgname/|" duke3d.sh
  sed -i -e "s|BINARY|./$pkgname-bin|" duke3d.sh
  install -m755 -D duke3d.sh $startdir/pkg/usr/bin/$pkgname
  install -m755 -D build $startdir/pkg/usr/share/$pkgname/$pkgname-build-bin
  cp $startdir/helper.sh build.sh
  sed -i -e "s|GAMEDIR|/usr/share/$pkgname/|" build.sh
  sed -i -e "s|BINARY|./$pkgname-build-bin|" build.sh
  install -m755 -D build.sh $startdir/pkg/usr/bin/$pkgname-build
  install -m644 -D $startdir/$pkgname.png $startdir/pkg/usr/share/pixmaps
  install -m644 -D $startdir/$pkgname.desktop $startdir/pkg/usr/share/applications
  install -m644 -D buildengine/BUILDLIC.TXT \
  $startdir/pkg/usr/share/licenses/custom/build/BUILDLIC.TXT

  rm -rf $startdir/src/$_svnmod-build
}
# vim:syntax=sh
