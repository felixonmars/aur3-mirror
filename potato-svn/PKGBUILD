# Maintainer: reiv3r@gmail.com Julie Iaccarino
pkgname=potato-svn
pkgver=670
pkgrel=2
pkgdesc="Potato is a MUSH/MU* Client for Microsoft Windows, Linux and Mac OS X."
license=('MIT')
url="http://www.potatomushclient.com/"
arch=('x86_64' 'i686')
makedepends=('subversion')
depends=('tcl' 'tk')
source=('potato.png' 'potato.desktop')
provides=('potato')
conflicts=('potato')

md5sums=('1bdfbe82ad98d761101a9581662ac7de'
         'a32562cdc58b9b97b7edfe51dd2007c1')


_svntrunk="http://potatomushclient.googlecode.com/svn/trunk"
_svnmod="potato"

build() {
  msg "Starting SVN checkout..."
  cd ${srcdir}
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "Finished."
}

package() {
  install -d -m755 "$pkgdir"/usr/share/{pixmaps,applications}
  install -d -m755 "$pkgdir"/opt/potato
  install -d -m755 "$pkgdir"/usr/bin

  cp -r "$srcdir"/"$_svnmod"/potato.vfs/* "$pkgdir"/opt/potato/

  # Compiling linflash.
  "$pkgdir"/opt/potato/lib/app-potato/linux/linflash1.0/compile

  # Installing binary
  install -D -m755 "$srcdir"/"$_svnmod"/potato.vfs/tools/linux/potato "$pkgdir"/usr/bin/potato

  install -D -m644 "$startdir"/potato.png "$pkgdir"/usr/share/pixmaps/
  install -D -m644 "$startdir"/potato.desktop "$pkgdir"/usr/share/applications/
}
