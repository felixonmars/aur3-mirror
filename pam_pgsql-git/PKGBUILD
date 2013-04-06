# Maintainer:  Gereon Schomber <Gereon underscore Schomber at arcor dot de>
pkgname=pam_pgsql-git
_gitname=pam-pgsql
pkgver=20111201
pkgrel=1
pkgdesc="A PAM module to authenticate users against postgresql (git version)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://gitorious.org/pam-pgsql"
depends=('postgresql-libs' 'libgcrypt')
makedepends=('git')
options=(!makeflags)
conflicts=('pam_pgsql')
source=("git://gitorious.org/$_gitname/$_gitname.git")

build() {

  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/ --docdir=/usr/share/doc/pam-pgsql
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install 
}

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}


sha1sums=('SKIP')
