# Contributor: ryooichi <ryooichi+arch AT gmail DOT com>
pkgname=ruby-1.8.7-svn
pkgver=24178
pkgrel=1
pkgdesc="Ruby is a dynamic, open source programming language with a focus on simplicity and productivity."
arch=('i686' 'x86_64')
url="http://www.ruby-lang.org"
license=('GPL2')
#groups=()
#depends=()
depends=('gdbm' 'db>=4.7' 'openssl>=0.9.8h-3' 'zlib' 'readline')
makedepends=('subversion')
#makedepends=('tk>=8.5')
#optdepends=()
provides=('ruby=1.8.7')
conflicts=('ruby')
#replaces=()
#backup=()
#install=
source=()
md5sums=()
#noextract=()
_svntrunk=http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8_7
_svnmod=ruby

build() {
  if [ -d $srcdir/.svn ]; then
    msg 'Updating...'
    svn up $srcdir
  else
    msg 'Checking out...'
    svn co $_svntrunk $srcdir
  fi
  cd $srcdir
  autoconf
  ./configure --prefix=/usr --enable-shared --enable-pthread || return 1
  #./configure --prefix=/opt/$pkgname --enable-shared --enable-pthread || return 1
  #./configure --prefix=/usr --enable-shared --enable-pthread --program-suffix=-1.8.7 || return 1
  make clean
  make || return 1
  #make test
  make DESTDIR=$pkgdir install
  make -j1 DESTDIR=$pkgdir install-doc
  install -Dm644 COPYING $pkgdir/usr/share/licenses/${pkgname}/COPYING
  #mv $pkgdir/usr/lib/ruby $pkgdir/usr/lib/ruby-1.8.7 || return 1
}
# vim:syntax=sh

