# Maintainer: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=dash-git
pkgver=20110421
pkgrel=1
pkgdesc="A POSIX compliant shell that aims to be as small as possible"
arch=('i686' 'x86_64')
url="http://gondor.apana.org.au/~herbert/dash/"
license=('BSD')
groups=('base')
depends=('glibc')
makedepends=('git')
conflicts=('dash')
provides=('dash')

_gitroot="http://git.kernel.org/pub/scm/utils/dash/dash.git"
_gitname=dash

build() {
  cd "$srcdir"
  if [[ -e $_gitname ]]
  then
     cd "$_gitname"
     git reset --hard
     git clean -f
     git pull
  else
     git clone "$_gitroot" "$_gitname"
     cd "$_gitname"
  fi

  autoreconf -is
  ./configure --prefix=/usr --mandir=/usr/share/man --exec-prefix=
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install

  # license
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
