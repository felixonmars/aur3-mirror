# Maintainer: falkTX <falktx@falktx.com>

pkgname=kxstudio-artwork
pkgver=20121222
pkgrel=1
pkgdesc="Artwork from KXStudio"
arch=(any)
url="http://kxstudio.sourceforge.net/KXStudio:Artwork"
license=('GPL2')
depends=("oxygen-icons")
optdepends=("qtcurve: theme support")
source=(https://downloads.sourceforge.net/project/kxstudio/Releases/artwork/"$pkgname"_$pkgver.tar.bz2)
md5sums=(b7780994f4664cce852343fc57e74fd4)

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Make required directories
  mkdir -p $pkgdir/lib/plymouth/themes/
  mkdir -p $pkgdir/usr/share/gnome-background-properties/
  mkdir -p $pkgdir/usr/share/icons/
  mkdir -p $pkgdir/usr/share/kde4/apps/color-schemes/
  mkdir -p $pkgdir/usr/share/kde4/apps/kdm/
  mkdir -p $pkgdir/usr/share/kde4/apps/ksplash/
  mkdir -p $pkgdir/usr/share/kde4/apps/QtCurve/
  mkdir -p $pkgdir/usr/share/themes/
  mkdir -p $pkgdir/usr/share/xfce4/backdrops/
  mkdir -p $pkgdir/usr/share/wallpapers/

  # Generic themes (Metacity and WFWM4)
  cp -r themes/* $pkgdir/usr/share/themes/

  # QtCurve style
  cp *.qtcurve $pkgdir/usr/share/kde4/apps/QtCurve/

  # KDE Colors
  cp color-schemes/* $pkgdir/usr/share/kde4/apps/color-schemes/

  # Icons
  cp -r -P icons/* $pkgdir/usr/share/icons/

  # KDM Theme
  cp -r -P kdm/* $pkgdir/usr/share/kde4/apps/kdm/

  # KSplash
  cp -r -P ksplash/* $pkgdir/usr/share/kde4/apps/ksplash/

  # Plymouth
  cp -r plymouth/* $pkgdir/lib/plymouth/themes/

  # Wallpapers (KDE, Gnome and XFCE compatible)
  cp -r wallpapers/KXStudio-* $pkgdir/usr/share/wallpapers/
  cp wallpapers/kxstudio-wallpapers.xml $pkgdir/usr/share/gnome-background-properties/
  cp wallpapers/KXStudio-Black/contents/images/1600x1200.jpg $pkgdir/usr/share/xfce4/backdrops/
  cp wallpapers/KXStudio-Heartbeat/contents/images/1920x1200.png $pkgdir/usr/share/xfce4/backdrops/
  cp wallpapers/KXStudio-KDE3/contents/images/1920x1440.jpg $pkgdir/usr/share/xfce4/backdrops/
  cp wallpapers/KXStudio-Stripes/contents/images/1920x1200.jpg $pkgdir/usr/share/xfce4/backdrops/
}
