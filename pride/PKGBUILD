# Maintainer: hyperfang8 <hyperfang8@gmail.com>
pkgname=pride
pkgver=latest
pkgrel=3
pkgdesc="Fast and simple POSIX alternative for Android development."
arch=('any')
url="http://pride.tuxfamily.org/"
license=('GPL')
makedepends=('unzip' 'sed')
depends=('apache-ant' 'zenity' 'imagemagick' 'android-sdk' 'android-sdk-platform-tools' 'android-sdk-build-tools' 'rxvt')
source=("http://pride.tuxfamily.org/pride_install.zip" "pathupdate.sh" "default.rc" "userconfig.sh" "pride.desktop")
md5sums=('SKIP'
         '90b2274496f467afef39ab11df49bdef'
         '1e57e328acc6d2dc4fac8a795315faf0'
         '8db3a117a24cd72c67dcf8e5962617c5'
         '25fba5dfb979c860720ab37f05602c4b')

prepare(){
  cd "$srcdir"
  unzip -o pride_install.zip
  sed -i '/dot=/c\ dot=/opt/pride/pride' $srcdir/pride_install/scripts/pride
  sed -i '/name=/c\ name=`cat $HOME/.pride/name`' $srcdir/pride_install/scripts/pride
  rm $srcdir/pride_install/pride/pride.rc
  cp $srcdir/userconfig.sh $srcdir/pride_install/pride/pride.rc
  cp $srcdir/default.rc $srcdir/pride_install/pride/default.rc
}

package() {
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/etc/profile.d
  cp -r $srcdir/pride_install/ $pkgdir/opt/pride
  cp $srcdir/pathupdate.sh $pkgdir/etc/profile.d/pride-latset.sh
  #cp $srcdir/pride.desktop $pkgdir/usr/share/applications/pride.desktop
  chmod 755 $pkgdir/opt/pride/scripts/*
  chmod 755 $pkgdir/opt/pride/pride/pride.rc
  chmod 755 $pkgdir/opt/pride/pride/pride.src
  chmod 755 $pkgdir/etc/profile.d/pride-latset.sh
}
