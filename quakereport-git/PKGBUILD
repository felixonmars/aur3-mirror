# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=quakereport-git
pkgver=20130322
pkgrel=1
pkgdesc="Simple application that connects to USGS to retrieve the list of latest earthquakes and display them on an interactive map."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/quakereport/"
license=('GPL3')
depends=('qtmobility' 'qtwebkit')
makedepends=('git')

_gitroot=git://git.code.sf.net/p/quakereport/code
_gitname=quakereport-code


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cd src
  qmake-qt4
  make
}

package() {
  cd "$srcdir/$_gitname-build"/src

  # Binary
  install -Dm755 quakereport $pkgdir/usr/bin/quakereport
 
  # Desktop icon
  install -Dm644 quakereport64.png $pkgdir/usr/share/pixmaps/quakereport64.png
  sed -i 's_Exec=/opt/quakereport/bin/quakereport_Exec=quakereport_' quakereport.desktop
  install -Dm644 quakereport.desktop $pkgdir/usr/share/applications/quakereport.desktop
  sed -i '9iCategories=Utility' $pkgdir/usr/share/applications/quakereport.desktop
}