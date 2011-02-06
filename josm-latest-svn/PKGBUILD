pkgname=josm-latest-svn
pkgver=3791
pkgrel=1
pkgdesc="An editor for OpenStreetMap written in Java."
arch=('any')
url="http://josm.openstreetmap.de/"
license=('GPL')
conflicts=('josm' 'josm-latest')
depends=('java-runtime' 'intltool' 'webkit-image')
makedepends=('subversion' 'apache-ant')
source=(josm.desktop josm.sh)
md5sums=('e2b8c820100f3403a6cd10c1239d659a'
         'a497395e555e22c5e0412ebbab911737')
_svntrunk=http://josm.openstreetmap.de/svn/trunk
_svnmod=josm


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

  #
  # BUILD
  #
  . /etc/profile.d/apache-ant.sh
  ant clean dist
}

package() {
  cd $startdir/src
  
  install -D -m644 ${_svnmod}-build/dist/josm-custom.jar $startdir/pkg/usr/share/java/josm/josm.jar || return 1
  install -D -m644 $startdir/src/josm.desktop $startdir/pkg/usr/share/applications/josm.desktop || return 1
  install -D -m755 $startdir/src/josm.sh $startdir/pkg/usr/bin/josm || return 1
  install -D -m644 $startdir/src/josm/images/logo.png ${startdir}/pkg/usr/share/pixmaps/josm.png || return 1
}
