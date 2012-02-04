# Maintainer: Schnouki <thomas.jost@gmail.com>
pkgname=iencode-svn
pkgver=48
pkgrel=1
pkgdesc="A set of scripts and config file to ease encoding of movies for iPhone/iPod Touch"
arch=('any')
url="https://svn.tynsoe.org/projects/iencode/"
license=('misc')
depends=('gpac' 'mplayer')
optdepends=('atomicparsley: for tagging files')
makedepends=('subversion')
source=('iencode.patch')
md5sums=('ae1327d7fcf9efffb52007a8490eb76d')

_svntrunk=https://svn.tynsoe.org/svn/iencode
_svnmod=iencode

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

  cd ${srcdir}/iencode
  patch -p0 < ${srcdir}/iencode.patch

  install -Dm755 iencode ${pkgdir}/usr/bin/iencode
  install -Dm755 divx-rename ${pkgdir}/usr/bin/divx-rename
  install -Dm755 divx-tag ${pkgdir}/usr/bin/divx-tag
  install -Dm644 iencode.conf ${pkgdir}/etc/iencode.conf
  install -Dm644 README ${pkgdir}/usr/share/doc/iencode/README

  rm -rf ${srcdir}/$_svnmod-build
}

