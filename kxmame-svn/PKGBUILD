# Contributor: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>

pkgname=kxmame-svn
pkgver=8
pkgrel=3
pkgdesc="KDE port of GXmame frontend for xmame and sdlmame emulators."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/kxmame"
license=('GPL2')
depends=('kdelibs3')
makedepends=('subversion')
provides=('kxmame')
conflicts=('kxmame')
install=kxmame.install
source=(kxmame.desktop)
md5sums=('645a5db5c41eade7afdfaba9694bcaad')

_svntrunk=https://kxmame.svn.sourceforge.net/svnroot/kxmame/trunk
_svnmod=kxmame

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

  sed -iautomake -e 's|automake\*1.10\*|automake\*1.1[0-5]\*|' admin/cvs.sh

  . /etc/profile.d/qt3.sh
  . /etc/profile.d/kde3.sh

  make -f Makefile.cvs
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt --disable-joystick \
              --without-arts
  make || return 1
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/kxmame.desktop" "$pkgdir/usr/share/applications/kxmame.desktop"
}
