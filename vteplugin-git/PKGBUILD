pkgname=vteplugin-git
pkgver=20111117
pkgrel=1
pkgdesc='vteplugin'
arch=('any')
url='https://github.com/arenevier/vteplugin'
license=('GPL')
makedepends=('git')
depends=('vte')

_gitroot="http://github.com/arenevier/vteplugin.git"
_gitname="vteplugin"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"
  sed -i 's/python/python2/' waf
  ./waf configure
  ./waf build
  ./waf install --destdir="$pkgdir"
  mkdir -p $pkgdir/usr/vteplugin
  sed -i 1i"<title>Terminal</title>" vteplugin.html
  cp vteplugin.html $pkgdir/usr/vteplugin/vteplugin.html
}

