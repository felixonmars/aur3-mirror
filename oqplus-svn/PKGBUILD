# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=oqplus-svn
pkgver=144
pkgrel=2
pkgdesc="A free content replacement project for Quake 1"
arch=('any')
url="http://openarena.ws/fsfps/oqplus.html"
license=('GPL')
makedepends=('svn' 'autoconf' 'automake' 'qpakman')
provides=('oqplus')
conflicts=('oqplus')
install=oqplus.install
source=(Makefile)
md5sums=('49a6003838dad7a520e17df8a362f386')

_svntrunk=http://mancubus.net/svn/hosted/fsfps/oqplus
_svnmod=oqplus

build() {
  [ -d $_svnmod/.svn ] && {
	cd $_svnmod
	svn up -r $pkgver
	cd ..
  } || {
	svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  }

  msg "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  cp -rf $_svnmod/ $_svnmod-build/
  cd $_svnmod-build
  ln -sf ../Makefile .

  msg "Starting make..."

  make || return 1
  make DESTDIR="$pkgdir" install
}
