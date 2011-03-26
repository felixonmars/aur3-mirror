# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=mediabox-svn
pkgver=1073
pkgrel=1
pkgdesc="Media Center from maemo.org"
arch=('i686' 'x86_64')
depends=('mplayer' 'python')
makedepends=('subversion')
license=('GPL2')
url="http://mediabox.garage.maemo.org/"

_svntrunk=https://vcs.maemo.org/svn/mediabox/trunk
_svnmod=mediabox

build() {
  cd $startdir/src

  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd mediabox/
  mkdir -p $pkgdir/opt/mediabox
  cp -R com/ components/ idtags/ io/ mediabox/ mediaplayer/ platforms/ storage/ theme/ \
        ui/ upnp/ utils/ mimetypes.mapping MediaBox.py \
        $pkgdir/opt/mediabox

  # Desktop icon
  install -Dm644 maemo-data/mediabox-mc.png    $pkgdir/usr/share/pixmaps/mediabox-mc.png
  install -Dm644 $startdir/mediabox-mc.desktop $pkgdir/usr/share/applications/mediabox-mc.desktop
}