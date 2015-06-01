# Maintainer:  viperpaulo

pkgname=faenzaflattr-icon-theme
_pkgname=FaenzaFlattr3
pkgver=3.0.1
pkgrel=1
pkgdesc="KDE 4 and KDE5 icons theme"
url="http://kde-look.org/content/show.php/FaenzaFlattr3?content=170105"
license=('CCPL:by-nc-sa-4.0')
arch=('any')
source=("${_pkgname}_${pkgver}.tar.gz::https://drive.google.com/uc?export=download&id=0BwlW9hKxf1tUaVI0ZUFxMFI1VUk")
sha1sums=('abe47c60049852a82c117c516354f4a08609f0be')
options=(!strip)

package() {
  install -d $pkgdir/usr/share/icons
  install -Dm644 $srcdir/${_pkgname}/COPYING $pkgdir/usr/share/licenses/${_pkgname}/COPYING
  cp -r $srcdir/${_pkgname}                  $pkgdir/usr/share/icons/
  #cp -r $srcdir/${_pkgname}-DarkBreeze       $pkgdir/usr/share/icons/
  #cp -r $srcdir/${_pkgname}-DarkDeco       $pkgdir/usr/share/icons/
  #cp -r $srcdir/${_pkgname}-Green            $pkgdir/usr/share/icons/
  rm $pkgdir/usr/share/icons/${_pkgname}/COPYING
  
#  install -Dm644 $srcdir/${_pkgname}-DarkBreeze/LICENSE.txt $pkgdir/usr/share/licenses/${_pkgname}-DarkBreeze/LICENSE
#  cp -r $srcdir/${_pkgname}-DarkBreeze       $pkgdir/usr/share/icons/
#  rm $pkgdir/usr/share/icons/${_pkgname}-DarkBreeze/LICENSE.txt

# # Small icons fix: use scalable icons instead of small ones
#   cd $pkgdir/usr/share/icons/${_pkgname}-DarkBreeze/places/
#   mv small/folder-documents.svg  small/folder-documents_dark.svg
#   mv small/folder-download.svg   small/folder-download_dark.svg
#   mv small/folder-dropbox.svg    small/folder-dropbox_dark.svg
#   mv small/folder-home.svg       small/folder-home_dark.svg
#   mv small/folder-music.svg      small/folder-music_dark.svg
#   mv small/folder-network.svg    small/folder-network_dark.svg
#   mv small/folder-pictures.svg   small/folder-pictures_dark.svg
#   mv small/folder-videos.svg     small/folder-videos_dark.svg
#   mv small/folder-virtualbox.svg small/folder-virtualbox_dark.svg
# 
#   ln -s scalable/folder-documents.svg small/folder-documents.svg
#   ln -s scalable/folder-download.svg  small/folder-download.svg 
#   ln -s scalable/folder-dropbox.svg   small/folder-dropbox.svg 
#   ln -s scalable/folder-home.svg      small/folder-home.svg     
#   ln -s scalable/folder-music.svg     small/folder-music.svg    
#   ln -s scalable/folder-network.svg   small/folder-network.svg  
#   ln -s scalable/folder-videos.svg    small/folder-videos.svg   

#   Old Firefox icon fix 
#   cd ../apps/scalable/
#   mv firefox.svg firefox_new.svg
#   ln -sf firefox2.svg firefox.svg

  find $pkgdir/usr -type f -exec chmod 644 {} \;
  find $pkgdir/usr -type d -exec chmod 755 {} \;
  find $pkgdir/usr -type f -name '.directory' -delete

}
