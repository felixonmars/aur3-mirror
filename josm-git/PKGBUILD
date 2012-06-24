pkgname=josm-git
pkgver=20120624
pkgrel=1
pkgdesc="An editor for OpenStreetMap written in Java."
arch=(i686 x86_64)
url="http://josm.openstreetmap.de/"
license=(GPL)
provides=(josm)
conflicts=(josm josm-latest josm-svn)
depends=(java-runtime)
makedepends=(git apache-ant)


source=(josm.sh josm.desktop)
md5sums=(a497395e555e22c5e0412ebbab911737
         e2b8c820100f3403a6cd10c1239d659a)
_gitroot="https://github.com/openstreetmap/josm.git"
_gitname="josm"

build(){
  cd $srcdir
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname"
    git reset --hard && git clean -dxf
    git pull 
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi

  . /etc/profile.d/apache-ant.sh
  ant clean dist
}

package() {
  cd "$srcdir/$_gitname"
  install -D -m644 ./dist/josm-custom.jar $pkgdir/usr/share/java/josm/josm.jar
  install -D -m644 ../josm.desktop $pkgdir/usr/share/applications/josm.desktop
  install -D -m755 ../josm.sh $pkgdir/usr/bin/josm
  install -D -m644 ./images/logo.png $pkgdir/usr/share/pixmaps/josm.png
} 


