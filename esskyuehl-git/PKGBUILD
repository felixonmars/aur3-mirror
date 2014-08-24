# Maintainer: kuri <guillaume@friloux.me>
# Contributor: chefpeyo <pierre-olivier.huguet@asp64.com>

pkgname=esskyuehl-git
pkgver=20140823
pkgrel=1
pkgdesc="Esskyuehl (ESQL) is a completely asynchronous client-side SQL library."
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('efl')
makedepends=('git')
optdepends=('libmariadbclient' 'sqlite' 'postgresql-libs')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://git.enlightenment.org/libs/esskyuehl.git"
_gitname="esskyuehl"

build() {
  cd $srcdir

  if [ $NOEXTRACT -eq 0 ]; then
    msg "Connecting to $_gitroot GIT server...."
    if [ -d $_gitname/.git ]; then
      (cd $_gitname && git pull origin)
    else
      git clone $_gitroot $_gitname
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."
  fi
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  ./autogen.sh --prefix=/usr
  make || return 1
}

package()
{
   cd $srcdir
   cd $_gitname-build

   install -Dm644 $srcdir/$_gitname/COPYING \
   $pkgdir/usr/share/licenses/$pkgname/COPYING

   install -Dm644 $srcdir/$_gitname/COPYING-MYSQL \
   $pkgdir/usr/share/licenses/$pkgname/COPYING-MYSQL

   make DESTDIR="$pkgdir" install
}
