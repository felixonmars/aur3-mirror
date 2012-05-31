# $Id: PKGBUILD 65147 2012-02-20 05:23:42Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ejabberd-mod_muc_admin-svn
pkgver=1126
pkgrel=1
pkgdesc="MUC web interface for ejabberd"
arch=(any)
url="http://www.ejabberd.im/ejabberd-modules"
license=('GPL')
depends=(ejabberd)
makedepends=(erlang subversion)
options=()

_svntrunk=https://svn.process-one.net/ejabberd-modules
_svnmod=ejabberd-modules
md5sums=()
md5sums=()

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r $srcdir/$_svnmod-build || true
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  #
  # BUILD
  #
  cd mod_muc_admin/trunk

  ./build.sh

  rm -rf ebin/.svn
  install -d -m 0755 $pkgdir/usr/lib/ejabberd
  cp -r ebin $pkgdir/usr/lib/ejabberd/ebin
}
