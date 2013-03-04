#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Dario 'Dax' Vilardi <dax [at] deelab [dot] org>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=amsn-extras-svn
pkgver=12402
pkgrel=1
pkgdesc="aMSN Extras like plugins and skins"
url="http://amsn.sourceforge.net"
license=('GPL')
arch=('i686' 'x86_64')
optdepends=('python: Depends for amsn' 'amsn: For apply in amsn' 'zenity: For plugin Desktop Integration')
makedepends=('subversion')
depends=('amsn-svn')
conflicts=('amsn')


_svntrunk="https://amsn.svn.sourceforge.net/svnroot/amsn/trunk/amsn-extras"
_svnmod="amsn-extras"

build() {
	
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
 
  install -d "$pkgdir"/usr/share/amsn
  cp -r "$srcdir"/amsn-extras/{plugins,skins} "$pkgdir"/usr/share/amsn

  find "$pkgdir" -name ".svn" -type d -exec rm -fr {} +
}
