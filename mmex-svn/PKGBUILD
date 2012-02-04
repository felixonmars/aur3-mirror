# Maintainer: TDY <tdy@gmx.com>

pkgname=mmex-svn
pkgver=882
pkgrel=1
pkgdesc="An easy-to-use personal finance suite (Money Manager Ex)"
arch=('i686' 'x86_64')
url="http://www.codelathe.com/mmex/"
license=('GPL')
depends=('wxgtk>=2.8.10')
makedepends=('boost' 'gettext' 'subversion')
optdepends=('cups: for printing support')
provides=('mmex')
conflicts=('mmex')
install=mmex.install
source=(mmex.desktop)
md5sums=('ac08bedafef42de7946353fff8da8a7c')

_svntrunk=http://moneymanagerex.svn.sourceforge.net/svnroot/moneymanagerex
_svnmod=mmex

build() {
  cd "$srcdir"

  msg "Connecting to $_svntrunk..."
  if [[ -d $_svnmod/.svn ]]; then
    cd $_svnmod && svn up -r $pkgver && cd ..
    msg2 "Local files updated"
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
    msg2 "SVN checkout done"
  fi

  rm -rf $_svnmod/trunk/$_svnmod-build
  cp -r $_svnmod/trunk/$_svnmod $_svnmod/trunk/$_svnmod-build
  install -dm755 $_svnmod/trunk/$_svnmod-build/wxbuild
  cd $_svnmod/trunk/$_svnmod-build/wxbuild

  msg "Starting make..."
  ../configure --prefix=/usr \
      --enable-unicode \
      --enable-shared \
      --with-wxshared \
      --with-gtk \
      --with-wx-config=/usr/lib/wx/config/gtk2-unicode-release-2.8
  make || return 1
}

package() {
  cd "$srcdir/$_svnmod/trunk/$_svnmod-build/wxbuild"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/mmex.desktop" \
    "$pkgdir/usr/share/applications/mmex.desktop"
  install -Dm644 ../graphics/mmexlogo.png "$pkgdir/usr/share/pixmaps/mmex.png"
}
