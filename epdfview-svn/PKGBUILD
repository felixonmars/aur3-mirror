# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Tom K <tomk@runbox.com>
# Contributor: Philipp Robbel <robbel@gmail.com>

pkgname=epdfview-svn
pkgver=355
pkgrel=1
pkgdesc="A free lightweight PDF document viewer"
arch=('i686' 'x86_64')
depends=('gtk2' 'poppler-glib')
optdepends=('cups: printing support')
makedepends=('subversion' 'pkgconfig' 'autoconf' 'automake')
conflicts=('epdfview')
provides=('epdfview')
source=()
md5sums=()
url="http://www.emma-soft.com/projects/epdfview/"
license=('GPL')

_svntrunk=svn://svn.emma-soft.com/epdfview/trunk
_svnmod=epdfview

build() {
  msg "Updating SVN entries for $_svnmod ..."

  cd $srcdir
  svn co $_svntrunk $_svnmod
  cd $_svnmod
  ./autogen.sh

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}
