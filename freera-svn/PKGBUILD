# Contributor: erm67
arch=(i686)
pkgname=freera-svn
pkgver=392
pkgrel=1
pkgdesc="GPL implementation of the Westwood RedAlert. Needs the .mix files from the original game"
url="http://www.freera.org/"
license='GPL'

depends=('sdl' 'sdl_mixer')
makedepends=('subversion' 'boost' 'scons')
conflicts=('freera')
provides=('freera')
install=('freera.install')

source=(freera.png \
	freera.desktop \
	helper.sh)

md5sums=('ed1182e1ec2c79cb3caa12ec25e77e08'
         '5ab3f9875e509a69b0c5dce3559bda70'
         'f9395546b2edbfca31c799345d7c4cf5')

_svntrunk=https://freera.svn.sourceforge.net/svnroot/freera/freera++/trunk
_svnmod=freera++

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r freera++/ $_svnmod-build
  cd $startdir/src/$_svnmod-build
  # fix compiler flags
  scons
  cp $startdir/helper.sh freera.sh
  sed -i -e "s|GAMEDIR|/usr/share/freera/|" freera.sh
  sed -i -e "s|BINARY|freera-bin|" freera.sh
  mkdir -p $startdir/pkg/usr/bin
  install -m755 -D freera $startdir/pkg/usr/bin/freera-bin
  install -m755 -D freera.sh $startdir/pkg/usr/bin/freera
  mkdir -p $startdir/pkg/usr/share/pixmaps
  install -m644 -D $startdir/freera.png $startdir/pkg/usr/share/pixmaps
  mkdir -p $startdir/pkg/usr/share/applications
  install -m644 -D $startdir/freera.desktop $startdir/pkg/usr/share/applications
  mkdir -p $startdir/pkg/usr/share/freera
  find data|grep .svn|xargs rm -rf
  mv data $startdir/pkg/usr/share/freera
  rm -rf $startdir/src/$_svnmod-build
}
# vim:syntax=sh
