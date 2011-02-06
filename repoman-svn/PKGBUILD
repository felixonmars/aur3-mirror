# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=repoman-svn
pkgver=239
pkgrel=1
pkgdesc="A tool to manage your personal Arch Linux repository"
arch=('any')
url="http://code.google.com/p/repoman-arch/"
license=('GPL3')
backup=('etc/repoman.conf')
depends=('lftp' 'bash')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=http://repoman-arch.googlecode.com/svn/trunk/
_svnmod=repoman

package() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod
  make DESTDIR=${pkgdir} install
}
