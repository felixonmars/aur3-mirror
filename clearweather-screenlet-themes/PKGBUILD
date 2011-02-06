# Contributor: twa022 <twa022@gmail.com>

pkgname=clearweather-screenlet-themes
pkgver=20090702
pkgrel=1
pkgdesc="Extra themes for ClearWeather screenlet"
arch=('any')
url="http://www.gnome-look.org/content/show.php/Blue+Skin+for+Clear+Weather+Screenlet?content=66610"
url="http://www.gnome-look.org/content/show.php/White+Skin+for+Clear+Wheather+Screenlet?content=90232"
license=('GPL')
depends=('screenlets')
source=("http://gnome-look.org/CONTENT/content-files/66610-blueskin_clearweather.tar.bz2"
		"http://gnome-look.org/CONTENT/content-files/90232-white.tar.bz2")
noextract=('90232-white.tar.bz2')
md5sums=('f262c591b82f7221777f8ea7bbd8f080'
         '924c95cb6002d07ab0fdac613349cfd0')

build() {
  cd $srcdir
  mkdir white
  tar -jxf 90232-white.tar.bz2 -C $srcdir/white
  mkdir -p $pkgdir/usr/share/screenlets/ClearWeather/themes/{white,blue}
  install -m644 $srcdir/blue/* $pkgdir/usr/share/screenlets/ClearWeather/themes/blue
  install -m644 $srcdir/white/* $pkgdir/usr/share/screenlets/ClearWeather/themes/white
}
