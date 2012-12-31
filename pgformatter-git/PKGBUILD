# Maintainer: Ilias-Dimitrios Vrachnis <vrachil@gmail.com>

pkgname=pgformatter-git
pkgver=20121231
pkgrel=1
pkgdesc="PostgreSQL SQL syntax beautifier"
arch=(any)
license=('PostgreSQL')
url="https://github.com/darold/pgFormatter"
depends=('perl')
makedepends=('git' 'perl')
md5sums=('SKIP')
_gitroot="git://github.com/darold/pgFormatter.git"
_gitname="pgFormatter"

build () {
 cd "$srcdir"
 msg "Connecting to GIT server..."
 if [ -d $_gitname ] ; then
   cd $_gitname && git pull origin
   msg "The local files are updated."
 else
   git clone --depth=1 $_gitroot $_gitname
 fi

 cd $_gitname
 perl Makefile.PL INSTALLDIRS='perl' || return 1
 make || return 1
}

package() {
 cd $srcdir/$_gitname
 make DESTDIR=$pkgdir install || return 1
}
