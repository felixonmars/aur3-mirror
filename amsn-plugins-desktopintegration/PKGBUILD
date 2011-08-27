# Contributor: Istvan Szentandrasi

pkgname=amsn-plugins-desktopintegration
pkgver=r9739
pkgrel=2
pkgdesc="amsn plugin that shows desktop-like dialogs instead of tcl/tk ones"
depends=('amsn')
optdepends=('zenity: for using this plugin with gtk' 'kdebase-kdialog: for using this plugin with kde')
arch=('any')
conflicts=('amsn-extras-svn')
license=('GPL')
groups=('amsn-plugins')
url="http://www.amsn-project.net/plugins.php"
_pluginname="desktop_integration"
source=(http://downloads.sourceforge.net/amsn/$_pluginname-$pkgver.zip)
md5sums=('75b7320ffa5dea069d03f6c979dd5c56')


build() {
  cd $srcdir/$_pluginname
 
  # Create destination directory
  install -d $pkgdir/usr/share/amsn/plugins/$_pluginname
  
  # Move .tcl and xml file
  install -m 0644 $srcdir/$_pluginname/* $pkgdir/usr/share/amsn/plugins/$_pluginname/
}

