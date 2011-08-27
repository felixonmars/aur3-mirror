# Contributor: twa022 <twa022@gmail.com>

pkgname=digitalclock-screenlet
pkgver=0.7.2
pkgrel=1
pkgdesc="Digital Clock with Extra Themes for Screenlets"
arch=('any')
url="http://gnome-look.org/content/show.php/DigitalClock?content=77234"
license=('GPL')
depends=('screenlets')
source=(http://www.fileden.com/files/2007/8/23/1373806/download/DigitalClock.tar.gz \
        http://gnome-look.org/CONTENT/content-files/92245-clean.tar.gz \
        clean-dark.tar.gz)
md5sums=('366f52c53d83c115fa40355ec07be4ca'
         'c8cfe1f8ce69d217765e766fbe707b9c'
         '8503faa92c66af5a3abb0895aba7ce9f')

build() {
  mkdir -p $pkgdir/usr/share/screenlets
  cp -r $srcdir/DigitalClock $pkgdir/usr/share/screenlets/
  chmod 755 $pkgdir/usr/share/screenlets/DigitalClock
  cp -r $srcdir/clean $pkgdir/usr/share/screenlets/DigitalClock/themes/
  cp -r $srcdir/clean-dark $pkgdir/usr/share/screenlets/DigitalClock/themes/
  chmod 755 $pkgdir/usr/share/screenlets/DigitalClock/themes
  chmod 755 $pkgdir/usr/share/screenlets/DigitalClock/themes/*
}
