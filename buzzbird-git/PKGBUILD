# Maintainer: Sven 'pfleidi' Pfleiderer <sven @ roothausen.de>
pkgname=buzzbird-git
pkgver=20100326
pkgrel=1
pkgdesc="A XULRunner based Twitter client. GIT-Version"
arch=('i686' 'x86_64')
license=('Custom')
depends=('alsa-lib' 'nss' 'libxt' 'xulrunner')
conflicts=('buzzbird')

url="http://getbuzzbird.com/bb/"
source=(LICENSE.txt buzzbird.sh)
md5sums=('3db51fe40e8846e71ca94169286e6bc9' '41708f1efdb5e00f6002bcab645985e6')

_gitroot="git://github.com/mdesjardins/buzzbird.git"
_gitname="buzzbird"

build() {
   cd "$srcdir"
   msg "Connecting to GIT server...."

   if [ -d $_gitname ] ; then
      cd $_gitname && git pull origin
      cd -
      msg "The local files are updated."
   else
      git clone $_gitroot
   fi

   msg "GIT checkout done or server timeout"

   mkdir -p $pkgdir/opt
   mkdir -p $pkgdir/usr/bin
   mkdir -p $pkgdir/usr/share/licenses/$_gitname
   cp LICENSE.txt  $pkgdir/usr/share/licenses/$_gitname/
   cp buzzbird.sh $srcdir/$_gitname

   cd $srcdir/$_gitname 

   # remove photoshop files
   find . -type f \( -name "*.psd" -or -name "*.exe" \) -exec rm {} \;

   # set linux skin and remove the others
   cp -r ./chrome/skin/classic-linux ./chrome/skin/classic 
   test -d ./chrome/skin/classic-win && rm -r ./chrome/skin/classic-win
   test -d ./chrome/skin/classic-mac && rm -r ./chrome/skin/classic-mac

   [ -d ./chrome/skin/classic ] || mkdir ./chrome/skin/classic
   cp -fr ./chrome/skin/classic-linux/* ./chrome/skin/classic/
   cp -fr ./chrome/content/platform/linux/* ./chrome/content/
   cp ./chrome/content/notifications/notify-linux.sh  ./chrome/content/notifications/notify.sh
   cp ./chrome/content/js/notify/notify-linux.js chrome/content/js/notify/notify.js

   cp -r $srcdir/$_gitname  $pkgdir/opt/$_gitname
   rm -r $pkgdir/opt/$_gitname/.git/
   ln -s /opt/$_gitname/buzzbird.sh $pkgdir/usr/bin/$_gitname
}
