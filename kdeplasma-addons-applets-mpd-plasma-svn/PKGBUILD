# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=kdeplasma-addons-applets-mpd-plasma-svn
pkgver=29
pkgrel=2
pkgdesc="Plasma MPD client to display and control playback"
url="http://code.google.com/p/mpdplasma/"
license=('Apache')
arch=('any')
depends=('kdebase-workspace' 'kdebindings-python2' 'python2-mpd')
makedepends=('subversion' 'tar')
conflicts=('kdeplasma-addons-applets-mpd-plasma')
provides=('kdeplasma-addons-applets-mpd-plasma')
_svntrunk="http://mpdplasma.googlecode.com/svn/trunk/"
_svnmod="mpd-plasma"

build() {
  cd "$srcdir"

  if [ -d "${_svnmod}/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  #
  # BUILD
  #

  python2 -m compileall src
}

package() {
  cd "${srcdir}/${_svnmod}-build/src"
  install -dm755 "${pkgdir}/usr/share/apps/plasma/plasmoids/mpd-plasma"
  tar -C . --exclude-vcs -cf - . | tar -C "${pkgdir}/usr/share/apps/plasma/plasmoids/mpd-plasma/" -xpf -
  install -Dm644 metadata.desktop "${pkgdir}/usr/share/kde4/services/plasma-applet-mpd-plasma.desktop"
}
