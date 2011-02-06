pkgname=youtube2music-svn
pkgver=42
pkgrel=1
pkgdesc="A video downloader tool"
url="http://youtube2music.sourceforge.net"
arch=('any')
license=('GPL')
depends=('pygtk' 'aria2' 'ffmpeg')
makedepends=('subversion')
conflicts=('youtube2music')
source=()
md5sums=()

_svntrunk=https://youtube2music.svn.sourceforge.net/svnroot/youtube2music/trunk
_svnmod=youtube2music

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r "$srcdir/$_svnmod-build"
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  install -d ${pkgdir}/usr/share/youtube2music/
  install -Dm644 gui-toolbar.glade search.py \
    ${pkgdir}/usr/share/youtube2music/ || return 1
  install -Dm755 y2m.py ${pkgdir}/usr/share/youtube2music/ || return 1
  install -Dm755 youtube2music ${pkgdir}/usr/bin/youtube2music || return 1
  install -Dm644 youtube2music64.png \
    ${pkgdir}/usr/share/pixmaps/youtube2music.png || return 1

  install -d ${pkgdir}/usr/share/locale/{it,en_US}/LC_MESSAGES/
  install -Dm644 po/it_IT/LC_MESSAGES/youtube2music.mo \
    ${pkgdir}/usr/share/locale/it/LC_MESSAGES || return 1
  install -Dm644 po/en_US/LC_MESSAGES/youtube2music.mo \
    ${pkgdir}/usr/share/locale/en_US/LC_MESSAGES || return 1

  patch -i patch/gui-toolbar.patch \
    ${pkgdir}/usr/share/youtube2music/gui-toolbar.glade
  patch -i patch/y2m.patch \
    ${pkgdir}/usr/share/youtube2music/y2m.py
}
