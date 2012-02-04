# Maintainer: cantabile <cantabile dot desu at gmail dot com>

_appname=gprename
pkgname=${_appname}-svn
pkgver=204
pkgrel=1
pkgdesc="A GTK2 batch renamer for files and directories"
arch=('any')
url="http://gprename.sourceforge.net/"
license=('GPL3')
depends=('gtk2-perl' 'perl-libintl-perl' 'perl-locale-gettext')
makedepends=('subversion')
provides=('gprename')
conflicts=('gprename')

_svntrunk=https://gprename.svn.sourceforge.net/svnroot/gprename
_svnmod=${_appname}

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

  #
  # BUILD
  #
}

package() {
  cd "$srcdir/$_svnmod-build/trunk"
  make PREFIX=/usr DESTDIR="$pkgdir/usr" install

  # because courier new is ugly
  sed -i 's/courier new/dejavu sans mono/g' "${pkgdir}/usr/bin/${_appname}"
}
