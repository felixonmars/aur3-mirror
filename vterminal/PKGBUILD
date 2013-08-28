# Maintainer: Bernd Prünster <bernd.pruenster@gmail.com>
pkgname=vterminal
provides=('vterminal')
pkgver=14
pkgrel=2
pkgdesc="A dock and DE independent terminal applet"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/vterminal"
license=("GPL")
depends=('libunique' 'gtk2' 'vte' 'hicolor-icon-theme')
makedepends=('python2' 'vala' 'subversion')

_svntrunk="svn://svn.code.sf.net/p/vterminal/code/"
_svnmod="${pkgname}-${pkgver}"

build() {
  msg "Connecting to SVN"
  if [ -d ${_svnmod}/.svn ]; then
    msg "Starting SVN update"
    (cd ${_svnmod} && svn up)

  else
    msg "Starting SVN checkout"
    svn co ${_svntrunk} ${_svnmod}
  fi
  msg "SVN checkout done or server timeout"

  msg "Starting build"
  cd ${_svnmod}

  python2 waf configure --prefix=/usr || return 1
  python2 waf build || return 1

}

package() {
        cd ${_svnmod}
        python2 waf --destdir=$pkgdir install
}
