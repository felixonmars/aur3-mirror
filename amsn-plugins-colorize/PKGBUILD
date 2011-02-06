
pkgname=amsn-plugins-colorize
pkgver=r11059
pkgrel=1
pkgdesc="This Amsn plugin change the color of your text from either a predefined list or randomly."
depends=('amsn')
arch=('i686' 'x86_64')
conflicts=('amsn-extras-svn')
license=('GPL')
groups=('amsn-plugins')
url="http://amsn.sourceforge.net"
_pluginname="colorize"
source=(http://downloads.sourceforge.net/amsn/$_pluginname-$pkgver.zip)
md5sums=('de51d7de0a327e2905a1e39cc6fe7316')


build() {
  cd $startdir/src/$_pluginname
 
  # Create destination directory
  install -d ${pkgdir}/usr/share/amsn/plugins/$_pluginname
  install -d ${pkgdir}/usr/share/amsn/plugins/$_pluginname/lang

  # Move lang files
  install -m 0644 $startdir/src/$_pluginname/lang/{langen,langes,langhu} \
  ${pkgdir}/usr/share/amsn/plugins/$_pluginname/lang/
  
  # Move .tcl and xml file
  install -m 0644 $startdir/src/$_pluginname/{plugininfo.xml,$_pluginname.tcl} ${pkgdir}/usr/share/amsn/plugins/$_pluginname/
}

