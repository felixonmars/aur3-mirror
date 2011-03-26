# Contributor: Matt Runion <mrunion@gmail.com> (based on PKGBUILD by Lukas Jirkovsky <l.jirkovsky@gmail.com>)
pkgname=blender-apricot
pkgver=20080527
pkgrel=1
pkgdesc="SVN version of Blender for the Apricot Project"
arch=('i686' 'x86_64')
url="http://blender.org/"
depends=('openexr' 'libxi' 'libjpeg' 'libpng' 'ffmpeg' 'gettext' 'python' 'desktop-file-utils' 'patch')
makedepends=('scons' 'subversion' 'sed')
provides=('blender')
conflicts=('blender')
license="GPL"
install=blender.install
source=(blender.sh blender.desktop blender.png)
md5sums=('e1bd54aaeedfbd934e532b6cad8c44f0' '0873d8b0b87eb91fdc0424aad1b62737'\
	 '2718ae258377bcc9c9942c28110ee89e')

_svnroot="https://svn.blender.org/svnroot/bf-blender/branches/apricot"
_svnmod="apricot"

build() {
  # Get the sources
  cd $startdir/src
  msg "Connecting to blender SVN server......."
  svn co $_svnroot
  msg "SVN checkout done"
  cd $startdir/src/$_svnmod

  ##########
  # tweak scons config script
  # first translate CFLAGS and CXXFLAGS for use
_CFLAGS=`echo $CFLAGS | sed -e "s/\ -O.//" -e "s/^/'/" -e "s/\ /','/g" -e "s/$/'/"`
_CXXFLAGS=`echo $CXXFLAGS | sed -e "s/\ -O.//" -e "s/^/'/" -e "s/\ /','/g" -e "s/$/'/"`
  sed "s/REL_CFLAGS\ =\ \['-O2'\]/REL_CFLAGS\ =\ \['`echo $CFLAGS | sed 's/.*\(-O[s,0-4]\).*/\1/g'`'\]/" -i config/linux2-config.py
  sed "s/REL_CCFLAGS\ =\ \['-O2'\]/REL_CCFLAGS\ =\ \['`echo $CXXFLAGS | sed 's/.*\(-O[s,0-4]\).*/\1/g'`'\]/" -i config/linux2-config.py

  sed -e "s|WITH_BF_OPENAL\ =\ 'true'|WITH_BF_OPENAL\ =\ 'false'|" \
  -e "s|WITH_BF_FFMPEG\ =\ 'false'|WITH_BF_FFMPEG\ =\ 'true'|" \
  -e "s|WITH_BF_VERSE\ =\ 'false'|WITH_BF_VERSE\ =\ 'true'|" \
  -e "s|BF_OPENGL_LIBPATH\ =\ '/usr/X11R6/lib'|BF_OPENGL_LIBPATH\ =\ '/usr/lib'|" \
  -e "s|^CCFLAGS\ =\ \[|CCFLAGS\ =\ \[$_CFLAGS,|" \
  -e "s|^CXXFLAGS\ =\ \[|CXXFLAGS\ =\ \[$_CXXFLAGS,|" -i config/linux2-config.py
unset _CFLAGS
unset _CXXFLAGS
  ##########
  scons || return 1
  ##########
  # so, now we compile some plugins
  mv -f $startdir/src/$_svnmod/install/linux2/plugins/* \
  	$startdir/src/$_svnmod/source/blender/blenpluginapi/
  cd $startdir/src/$_svnmod/source/blender/blenpluginapi
  chmod 755 bmake
  make
  ###########
  # And...Install!!!
  cd $startdir/src/install/linux2
  install -D -m755 blender $startdir/pkg/usr/share/blender/blender
  cp -R .blender/locale $startdir/pkg/usr/share/
  install -m644 .blender/.bfont.ttf $startdir/pkg/usr/share/blender/.bfont.ttf
  install -m644 .blender/.Blanguages $startdir/pkg/usr/share/blender/.Blanguages
  cp -R .blender/scripts $startdir/pkg/usr/share/blender/
  mkdir  -p $startdir/pkg/usr/share/blender/plugins/{sequence,texture}
  cp $startdir/src/$_svnmod/source/blender/blenpluginapi/sequence/*.so \
  	$startdir/pkg/usr/share/blender/plugins/sequence/
  cp $startdir/src/$_svnmod/source/blender/blenpluginapi/texture/*.so \
  	$startdir/pkg/usr/share/$_svnmod/plugins/texture/
  install -D -m755 $startdir/src/blender.sh $startdir/pkg/usr/bin/blender
  install -D -m644 $startdir/src/blender.desktop \
  	$startdir/pkg/usr/share/applications/blender.desktop
  install -D -m644 $startdir/src/blender.png $startdir/pkg/usr/share/pixmaps/blender.png
}
