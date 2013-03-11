 # Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=mangui
pkgver=1.2
pkgrel=2
pkgdesc="Application for accessing information about linux commands and programs in a GUI!"
arch=('any')
url="http://gnome-look.org/content/show.php/Mangui?content=157343"
license=('GPL3')
depends=('mlocate' 'python2' 'python2-gobject' 'zenity')
install=$pkgname.install
source=(https://sourceforge.net/projects/manguiubuntu/files/${pkgname}_${pkgver}_all.deb
        $pkgname
        $pkgname.install)
md5sums=('996243080e954def229398203a3d1d33'
         'f8c02b917977cad5a457ad31421883e8'
         'c39514a831a066c75ef3dd1447a8a64f')

package() {
   cd $srcdir
   
   # Extract .deb package
   bsdtar xf data.tar.gz -C $pkgdir

   # Start file in path
   install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
   
   # Fix Python2
   cd $pkgdir/opt/extras.ubuntu.com/mangui
   sed -i 's|python|python2|' bin/mangui

   # Fix 'locate' command. '/usr/local/bin' directory doesn't exist in Arch
   sed -i 's|/usr/local/bin||' mangui/ManguiWindow.py

   # Fix desktop file
   cd $pkgdir/usr/share/applications
   mv extras-mangui.desktop mangui.desktop
   sed -i 's|/opt/extras.ubuntu.com/mangui/bin/||' mangui.desktop
   
   # License
   cd ..
   install -Dm644 doc/mangui/copyright $pkgdir/usr/share/licenses/$pkgname/LICENSE

   # Delete unnecessary stuff
   rm -rf {doc,python}   
}