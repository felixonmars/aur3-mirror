# Contributor: swiftscythe <swiftscythe@gmail.com>

pkgname=kmldonkey-svn
pkgver=1227827
pkgrel=1
pkgdesc="A frontend for MLDonkey, a powerful P2P file sharing tool, designed for the KDE desktop. This is the development branch."
arch=(i686 x86_64)
url="http://userbase.kde.org/KMLDonkey"
license=('GPL')
depends=('kdelibs')
makedepends=(cmake automoc4)
provides=(kmldonkey)
conflicts=(kmldonkey)
replaces=(kmldonkey)

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/extragear/network/kmldonkey
_svnmod=kmldonkey

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
  make  || return 1
  make DESTDIR=$pkgdir install

  rm -rf $srcdir/$_svnmod-build
}


