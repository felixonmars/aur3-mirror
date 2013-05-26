# Current i686 Maintainer: ifaigios <ifaigios_at_gmail_dot_com>
# Contributor: moostik <mooostik_at_gmail_dot_com>

pkgname=geogebra-svn
_svnmod=geogebra
pkgver=25588
pkgrel=1
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet - SVN version"
arch=('i686' 'x86_64')
url="http://www.geogebra.org/"
license=('custom')
        # Application and source code under GPLv3
        # Language files and documentation under CC-BY-SA 3.0
        # Installer scripts under CC-BY-NC 3.0
depends=('java-runtime' 'shared-mime-info' 'xdg-utils' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('java-environment' 'subversion' 'apache-ant')
optdepends=('geogebra-thumbnail-kde: KDE thumbnailer for GeoGebra')
install="geogebra.install"
provides=('geogebra' 'geogebra-beta' 'geogebra42-beta' 'geogebra5-beta')
conflicts=('geogebra' 'geogebra-beta' 'geogebra42-beta' 'geogebra5-beta')
source=(geogebra.sh
        $_svnmod::svn+http://dev.geogebra.org/svn/trunk)
md5sums=('2f87f90d8047eeda6886bcb6a8ba3d9b'
         'SKIP')

pkgver() {
  cd "$SRCDEST/$_svnmod"
  svnversion
}

build() {
  cd $srcdir/$_svnmod/tools/build/platforms/desktop/jogl2
  ./1-compile
}

package() {
    # Installing application
  cd $srcdir/$_svnmod/geogebra/desktop/build
  install -dm755 $pkgdir/usr/share/java/geogebra/
  install -Dm644 * $pkgdir/usr/share/java/geogebra/

    # Installing launcher
  install -Dm755 $srcdir/geogebra.sh $pkgdir/usr/bin/geogebra

    # Installing icons
  cd $srcdir/$_svnmod/geogebra/desktop/icons/hicolor
  for i in *; do
    install -dm755 $pkgdir/usr/share/icons/hicolor/$i/{apps,mimetypes}
    install -Dm644 $i/apps/* $pkgdir/usr/share/icons/hicolor/$i/apps
    install -Dm644 $i/mimetypes/* $pkgdir/usr/share/icons/hicolor/$i/mimetypes
  done

    # Installing menu item
  install -Dm644 $srcdir/$_svnmod/geogebra/desktop/scripts/autobuild/linux/generic/geogebra.desktop $pkgdir/usr/share/applications/geogebra.desktop

    # Installing mimetype
  install -Dm644 $srcdir/$_svnmod/geogebra/desktop/scripts/autobuild/linux/generic/geogebra.xml $pkgdir/usr/share/mime/packages/geogebra.xml

    # Installing license
  install -Dm644 $srcdir/$_svnmod/geogebra/desktop/installer/LICENSE.txt $pkgdir/usr/share/licenses/geogebra/LICENSE
}
