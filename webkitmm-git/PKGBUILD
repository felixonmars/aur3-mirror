# $Id: $
# Contributor: maleadt <tim.besard@gmail.com>

pkgname=webkitmm-git
_gitname=webkitmm-git
pkgver=20100810
pkgrel=1
pkgdesc="GNOME C++ common macros."
arch=('i686' 'x86_64')
url="http://gitorious.org/webkitmm"
license=('GPL')
depends=("mm-common")
makedepends=('git')
_gitroot="git://gitorious.org/~jeremyh/webkitmm/jeremy-fixes.git"


build() {

  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname ]]; then
    cd $srcdir/$pkgname && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname || return 1
    cd $srcdir/$pkgname
  fi

  msg "GIT checkout done or server timeout"


  cd "${srcdir}/${pkgname}"
  ./autogen.sh
  ./configure --disable-documentation --prefix=/usr || return 1
  cd "webkit/src"	# download.lo
  make || return 1	# needs to be
  cd ../../		# built first
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

