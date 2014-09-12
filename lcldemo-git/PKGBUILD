# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Mariano Street <mstreet@kde.org.ar>

pkgname=lcldemo-git
_basename=lcldemo
pkgver=r5.7ee0791
pkgrel=1
pkgdesc='Live Command Line prototype for the Sapphire desktop environment'
arch=(i686 x86_64)
url="http://gitorious.org/delphos/$_basename"
license=('GPL3')
groups=('sapphire')
depends=('qt4' 'dbus')
optdepends=('sapphire-desktop: innovative and usability-oriented desktop environment')
provides=('lcldemo')
source=("git://gitorious.org/delphos/$_basename.git")
md5sums=('SKIP')


pkgver() {
  cd "$_basename"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir/$_basename"

    qmake-qt4
    make
}

package () {
    cd "$srcdir/$_gitname-build"
    mkdir -p "$pkgdir/usr/bin"
    cp lcldemo "$pkgdir/usr/bin"
}
