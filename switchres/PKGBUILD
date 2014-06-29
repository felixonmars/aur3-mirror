# Maintainer: Matthew Coulson <jmcoulson@gmail.com>

pkgname=switchres
pkgver=1.52
pkgrel=1
pkgdesc="Modeline generator engine, part of the GroovyArcade system"
arch=('i686' 'x86_64')
url="http://code.google.com/p/groovyarcade"
license=('GPL')
depends=('libxml2')
makedepends=('git')
source=("$pkgname"::'git+http://code.google.com/p/groovyarcade.switchres/')
md5sums=('SKIP')

_gitroot=http://code.google.com/p/groovyarcade.switchres/
_gitname=switchres
_version=SwitchResLinux-$pkgver

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
  cd "$srcdir/$_gitname-build/$_version"
  chmod u+x version.sh  
  make
}

package() {
  cd "$srcdir/$_gitname-build/$_version"
  install -Dm755 switchres $pkgdir/usr/bin/${pkgname}
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname}/README
}
