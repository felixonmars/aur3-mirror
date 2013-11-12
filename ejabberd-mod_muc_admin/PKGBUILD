# $Id: PKGBUILD 65147 2012-02-20 05:23:42Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ejabberd-mod_muc_admin
pkgver=20131111
pkgrel=1
pkgdesc="MUC web interface for ejabberd"
arch=(any)
url="http://www.ejabberd.im/ejabberd-modules"
license=('GPL')
depends=(ejabberd)
makedepends=(erlang git)
options=()
source=("git://github.com/processone/ejabberd-contrib.git"
	"build-fix.patch")
md5sums=('SKIP'
         'ca7c6731536084aa4cd036735c48b200')

prepare() {
  cd $srcdir/ejabberd-contrib
  patch -p1 <$srcdir/build-fix.patch
}

build() {
  cd $srcdir/ejabberd-contrib/mod_muc_admin
  ./build.sh
}

package() {
  cd $srcdir/ejabberd-contrib/mod_muc_admin
  install -d -m 0755 $pkgdir/usr/lib/ejabberd
  cp -r ebin $pkgdir/usr/lib/ejabberd/ebin
}
