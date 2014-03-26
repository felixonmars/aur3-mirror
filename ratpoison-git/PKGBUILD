# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintained by ivoarch <ivkuzev@gmail.com>
pkgname=ratpoison-git
pkgver=v1.4.6.170.g410c7f1
pkgrel=1
epoch=
pkgdesc="Ratpoison from git"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/ratpoison/"
license=('GPL')
groups=()
depends=('libxinerama' 'readline' 'bash' 'perl' 'libxtst' 'libxft')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('ratpoison')
replaces=('ratpoison')
conflicts=('ratpoison')
backup=()
options=()
install=
changelog=
source=("git://git.savannah.nongnu.org/ratpoison.git")
noextract=()
md5sums=('SKIP')

gitname=ratpoison

pkgver() {
  cd "${srcdir}/${gitname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${gitname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
  cd contrib/
  ./genrpbindings
  make
  cd ..
}

package() {
  cd "$srcdir/$gitname"
  install -d "$pkgdir/usr/share/$gitname/bindings"

  make DESTDIR="$pkgdir" install
  install -m 644 contrib/{Ratpoison.pm,ratpoison-cmd.el,ratpoison.rb,ratpoison.lisp,ratpoison.py} \
    "$pkgdir/usr/share/$gitname/bindings"

  chmod a+x $pkgdir/usr/share/$gitname/{rpws,clickframe.pl,allwindows.sh,ratdate.sh,rpshowall.sh,split.sh}
  rm -rf "$pkgdir/usr/share/info/dir"
}

# vim:set ts=2 sw=2 et: