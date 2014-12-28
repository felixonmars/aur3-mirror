# Contributor: giorgio gilestro <giorgio@gilest.ro>               
# Maintainer: giorgio gilestro <giorgio@gilest.ro>

pkgname=android-notifier-desktop
pkgver=0.5.1
pkgrel=2
pkgdesc="Multi-platform client for the androd-notifier app."
url="http://android-notifier.googlecode.com"
arch=('i686' 'x86_64')
depends=('java-runtime')
optdepends=('libnotify: libnotify alert support' 'bluez: support for bluetooth connection')

if [ "${CARCH}" = 'x86_64' ]; then
      parch='amd64'
      md5sums=('25ae06e662b73d3da8436a1c4d1bb71d'
               '066297cabc230491c3a7cdaff7860319'
               '57297e06a9fa7e8cb42266947cb8ea3f')
    else
      parch='i386'
      md5sums=('0ba963fe3812972d8c4288bdc931bddc'
         '066297cabc230491c3a7cdaff7860319'
         '57297e06a9fa7e8cb42266947cb8ea3f')
fi

source=("http://android-notifier.googlecode.com/files/${pkgname}-${pkgver}-linux-${parch}.zip" "android-notifier-desktop.desktop" "android-notifier-desktop.png")
license=('GPL')


package() {
  mkdir -p $pkgdir/usr/share/android-notifier-desktop/lib
  mkdir -p $pkgdir/usr/share/icons/android-notifier-desktop
  mkdir -p $pkgdir/usr/share/applications  
  mkdir -p $pkgdir/usr/share/pixmaps  
  
  cd $srcdir
  install -D android-notifier-desktop.desktop $pkgdir/usr/share/applications/
  install -D android-notifier-desktop.png $pkgdir/usr/share/pixmaps/

  cd $srcdir/${pkgname}
  sed -i 's#android-notifier-desktop.jar#/usr/share/android-notifier-desktop/android-notifier-desktop.jar#' run.sh
  install -D android-notifier-desktop.jar $pkgdir/usr/share/android-notifier-desktop/
  install -D run.sh $pkgdir/usr/share/android-notifier-desktop/
  install -D lib/* $pkgdir/usr/share/android-notifier-desktop/lib/
  install -D icons/* $pkgdir/usr/share/icons/android-notifier-desktop/
  
}
