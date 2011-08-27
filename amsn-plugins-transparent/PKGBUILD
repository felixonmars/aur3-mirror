
pkgname=amsn-plugins-transparent
pkgver=r10840
pkgrel=2
pkgdesc="This Amsn plugin makes chat windows transparent when not used, with a nice fade transition (composite required)."
depends=('amsn')
arch=('any')
conflicts=('amsn-extras-svn')
license=('GPL')
groups=('amsn-plugins')
url="http://www.amsn-project.net/plugins.php#45"
_pluginname="transparent"
source=(http://downloads.sourceforge.net/amsn/$_pluginname-$pkgver.zip)
md5sums=('9c2c7e050b75bbdb6b1402605491f42f')


build() {
  cd $srcdir/$_pluginname
 
  # Create destination directory
  install -d $pkgdir/usr/share/amsn/plugins/$_pluginname
  install -d $pkgdir/usr/share/amsn/plugins/$_pluginname/lang
  
  # Move lang files
  install -m 0644 $srcdir/$_pluginname/lang/* $pkgdir/usr/share/amsn/plugins/$_pluginname/lang/
  
  # Move .tcl and xml file
  install -m 0644 $srcdir/$_pluginname/{plugininfo.xml,$_pluginname.tcl} $pkgdir/usr/share/amsn/plugins/$_pluginname/
}

