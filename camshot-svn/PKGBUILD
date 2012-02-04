# Maintainer: Tasos Latsas <tlatsas2000 _at_ gmail _dot_ com>

pkgname=camshot-svn
pkgver=12
pkgrel=1
pkgdesc="Linux console webcam screenshot utility"
arch=('i686' 'x86_64')
url="http://code.google.com/p/camshot/"
license=('GPL')
depends=('glibc')
makedepends=('subversion')

_svntrunk="http://camshot.googlecode.com/svn/trunk/"
_svnmod="trunk"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  install -Dm775 camshot "${pkgdir}/usr/bin/camshot"
}

# vim:set ts=2 sw=2 et:
