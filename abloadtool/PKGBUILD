# PKGBUILD by hasufell <jd.o@gmx.de>
###########################################################################################################
# KDE-OPTION 				KDE-OPTION
###########################################################################################################
#
## Set this to "y" if you want a right-click menu action for abloadtool ('upload in background' and 
## 'open in abload'). This is only for KDE and will work for example in Dolphin, Konqueror or Krusader! 
## Be careful, it works for multiple image files.
#
_kdemenu="n"


###########################################################################################################
pkgname=abloadtool
pkgver=3.0
pkgrel=3
pkgdesc="upload tool for the imagehoster abload"
arch=('i686' 'x86_64')
url="http://www.abload.de/tool.php"
license=('LGPL2')
depends=('qt')
makedepends=('libarchive')

if [ "$CARCH" = "i686" ]; then
    _arch='i386'
    _file="${pkgname}-${pkgver}.${_arch}.deb"
    source=("http://www.abload.de/tool/ubuntu/${pkgname}-${pkgver}.${_arch}.deb"
	    'abloadaction.desktop')
    md5sums=('7c0d8a0cb375578727ead6b3ce7a2629'
             '370a428be3150051c147cede5d90aecd')

elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
    _file="${pkgname}-${pkgver}.${_arch}.deb"
    source=("http://www.abload.de/tool/ubuntu/${pkgname}-${pkgver}.${_arch}.deb"
	    'abloadaction.desktop')
    md5sums=('fc731447e64a580fc2250f014b631b59'
             '370a428be3150051c147cede5d90aecd')

fi

build() 
{

cd $srcdir
  bsdtar -xf "${_file}" data.tar.gz
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  rm data.tar.gz

cd $pkgdir/usr/lib
  rm libabload.so.*
  ln -sf ./libabload.so ./libabload.so.0
  ln -sf ./libabload.so ./libabload.so.0.1
  ln -sf ./libabload.so ./libabload.so.0.1.0

if [ "$_kdemenu" = "y" ]; then
  install -Dm644 "${srcdir}"/abloadaction.desktop "${pkgdir}"/usr/share/kde4/services/ServiceMenus/abloadaction.desktop
fi

}
