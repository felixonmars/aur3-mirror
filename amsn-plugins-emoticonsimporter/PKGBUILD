
pkgname=amsn-plugins-emoticonsimporter
pkgver=r11107
pkgrel=2
pkgdesc="Amsn plugin that allows you to batch import multiple emoticons into aMSN in one shot. Compatible with kopete emoticon packs."
depends=('amsn')
arch=('any')
conflicts=('amsn-extras-svn')
license=('GPL')
groups=('amsn-plugins')
url="http://www.amsn-project.net/plugins.php"
_pluginname="emoticons_importer"
source=(http://downloads.sourceforge.net/amsn/$_pluginname-$pkgver.zip)
md5sums=('fd2d1274e18bee58e9ee40542a0a3b18')

build() {
  cd $srcdir/$_pluginname
 
  # Create destination directory
  install -d $pkgdir/usr/share/amsn/plugins/$_pluginname
  install -d $pkgdir/usr/share/amsn/plugins/$_pluginname/lang

  # Move lang files
  install -m 0644 $srcdir/$_pluginname/lang/* $pkgdir/usr/share/amsn/plugins/$_pluginname/lang/
  
  # Move .tcl and xml file
  install -m 0644 $srcdir/$_pluginname/{$_pluginname.tcl,plugininfo.xml} $pkgdir/usr/share/amsn/plugins/$_pluginname/
}

