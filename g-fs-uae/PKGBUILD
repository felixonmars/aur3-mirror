# Contributer: giacomogiorgianni@gmail.com

pkgname=g-fs-uae
_name=G-FS-UAE
_system= grep 'Manjaro' /etc/issue | tr -s " "|cut -d" " -f1
pkgver=0.0.61
pkgrel=2
pkgdesc="A simple gui for fs-amiga emulator "
arch=('any')
url="http://sourceforge.net/projects/gfsuae"
license='GPL'

if [ "${_system}" = 'Manjaro'  ]; then
    depends=('gambas3-runtime' 'fs-uae' 'gambas3-gb-image' 'gambas3-gb-qt4' 'gambas3-gb-qt4-ext' 'gambas3-gb-form' 'gambas3-gb-desktop' 'gambas3-gb-settings')
elif [ "${_system}" = 'Manjaro' ]; then
         depends=('gambas3-runtime' 'fs-uae' 'gambas3-gb-image' 'gambas3-gb-qt4' 'gambas3-gb-qt4-ext' 'gambas3-gb-form' 'gambas3-gb-desktop' 'gambas3-gb-desktop-x11' 'gambas3-gb-settings')
fi

#source=(http://sourceforge.net/projects/gfsuae/files/Package/debian.tar.gz)
source=(http://switch.dl.sourceforge.net/project/gfsuae/sources/${_name}-${pkgver}.tar.gz $pkgname.desktop)
md5sums=('e79e9cbcf81acb82653f2dca6cd8458c'
	'37e4f0a203c037b1327d31898da71225')


#build() {
#  cd "$srcdir/$_name"
#}

package() {
   cd "$srcdir/$_name"
    # bin
    install -Dm755 $_name.gambas \
    "$pkgdir/usr/bin/$_name.gambas"
    
    # desktop file
    install -Dm644 $srcdir/$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
    
    # icon
    install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
    
    # document
  install -Dm644 "$srcdir/$_name/.hidden/CHANGELOG" \
    "$pkgdir/usr/share/doc/CHANGELOG"


 }

