# Maintainer: Ray Griffin <rorgoroth@googlemail.com>
# Contributor: zajca <zajcaa@gmail.com>

pkgname=tintwizard-svn
pkgver=209
pkgrel=2
pkgdesc="This project aims to provide an easy way to change the appearance of tint2. Through an easy-to-use graphical user interface, you can generate configs and apply to them tint2."
arch=('any')
url="http://code.google.com/p/tintwizard/"
license=('GPL3')
depends=('python2' 'pygtk')
optdepends=('tint2: tint2 panel' 'tint2-svn: tint2 panel from svn')
makedepends=('subversion')
install=tintwizard.install
provides=('tintwizard')
conflicts=('tintwizard')
source=(tw.sh)
md5sums=('46a3840a03ddb19c87792db57f56193f')

_svnmod="tintwizard"
_svntrunk="http://tintwizard.googlecode.com/svn/trunk/"

build() {
  cd ${srcdir}

  msg "Getting sources..."
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    cd ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
}

package() { 
mkdir -p $pkgdir/usr/{bin,share}
cp -r $srcdir/tintwizard $pkgdir/usr/share/tintwizard
install -D -m755 $srcdir/tw.sh $pkgdir/usr/bin/tintwizard
}