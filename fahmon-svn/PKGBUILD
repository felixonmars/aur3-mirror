# Contributor: Whaevr <whaevr[at]gmail[dot]com>

pkgname=fahmon-svn
_realname=fahmon
pkgver=433
pkgrel=1
pkgdesc="Svn version of the popular monitoring client for Folding@Home"
arch=('i686' 'x86_64')
url="http://fahmon.net/"
license=('GPL')
depends=('wxgtk>=2.8' 'glitz')
makedepends=('desktop-file-utils' 'subversion')
conflicts=('fahmon')
install=fahmon.install
options=('!emptydirs')
source=()
md5sums=()

_svntrunk=http://svn.fahmon.net/trunk
_svnmod=fahmon

build() {
cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  cd ${srcdir}/${_realname}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
  install -Dm644 ${srcdir}/fahmon.desktop ${pkgdir}/usr/share/applications/fahmon.desktop
  install -Dm644 ${srcdir}/${_realname}/src/images/dialog_icon.png \
    ${pkgdir}/usr/share/pixmaps/fahmon.png
}

# vim:set ts=2 sw=2 et:

