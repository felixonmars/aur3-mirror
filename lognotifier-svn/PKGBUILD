# Contributor: Boyko Sergey <viruner@gmail.com>

pkgname=lognotifier-svn
pkgver=2
pkgrel=1
pkgdesc="Simple LogFile notifier"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/lognotifier/"
license=('GPL3')
depends=('glib2' 'gtk2' 'libnotify')
makedepends=('subversion')

source=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://lognotifier.svn.sourceforge.net/svnroot/lognotifier
_svnmod=lognotifier

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}

