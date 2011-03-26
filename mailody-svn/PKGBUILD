# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>

pkgname=mailody-svn
_realname=mailody
pkgver=1042678
pkgrel=1
pkgdesc="A mail client for KDE (an option to Kmail)"
arch=('i686' 'x86_64')
url="http://www.mailody.net"
license=('GPL')
depends=('kdelibs>=4.3' 'qt>=4.5' 'soprano' 'kdepim-runtime>=4.3' 'kdepimlibs>=4.3.67' 'kdeedu-marble>=4.3' 'kdesdk-kioslave')
makedepends=('cmake>=2.6.2' 'automoc4' 'subversion')
provides=($_realname)
conflicts=($_realname)

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/extragear/pim/mailody
_svnmod=mailody

build() {

  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DQTDIR=`kde4-config --qt-prefix` -DCMAKE_BUILD_TYPE=RELEASE . || return 1

  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

}
