# Maintainer: Bradley Jestico <brad_j@live.co.uk>

pkgname=kdeplasma-themes-hexlite
pkgver=0.4
pkgrel=1
pkgdesc="A KDE theme set, this includes 2 QtCurve and Aurorae themes, 2 color schemes and a Plasma theme."
arch=('any')
url=(http://kde-look.org/content/show.php/Hex+Lite?content=164224)
license=('GPL')
depends=('kdebase-workspace')
source=("http://kde-look.org/CONTENT/content-files/164224-HexLite-KDETheme.zip")

sha256sums=('23652a5837eed925e04d9801f4371e997c786b3d3995a0cb176149878e472e24')

package () {

  mkdir -p -m755 "$pkgdir/usr/share/apps/QtCurve"
  mkdir -p -m755 "$pkgdir/usr/share/apps/color-schemes"
  mkdir -p -m755 "$pkgdir/usr/share/apps/desktoptheme"
  mkdir -p -m755 "$pkgdir/usr/share/apps/aurorae/themes"

  cp --no-preserve=mode "$srcdir/HexLite-KDETheme/QtCurve/HexGrey.qtcurve" "$pkgdir/usr/share/apps/QtCurve"
  cp --no-preserve=mode "$srcdir/HexLite-KDETheme/QtCurve/HexMidnite.qtcurve" "$pkgdir/usr/share/apps/QtCurve"
  cp --no-preserve=mode "$srcdir/HexLite-KDETheme/Color Schemes/HexGrey.colors" "$pkgdir/usr/share/apps/color-schemes/"
  cp --no-preserve=mode "$srcdir/HexLite-KDETheme/Color Schemes/HexMidnite.colors" "$pkgdir/usr/share/apps/color-schemes/"
  cp -r --no-preserve=mode "$srcdir/HexLite-KDETheme/Plasma/HexLite/" "$pkgdir/usr/share/apps/desktoptheme"
  cp -r --no-preserve=mode "$srcdir/HexLite-KDETheme/Aurorae/HexGrey/" "$pkgdir/usr/share/apps/aurorae/themes/"
  cp -r --no-preserve=mode "$srcdir/HexLite-KDETheme/Aurorae/HexMidnite/" "$pkgdir/usr/share/apps/aurorae/themes/"

}