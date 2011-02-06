
pkgname=amsn-plugins-fortune
pkgver=1.0
pkgrel=2
pkgdesc="This Amsn plugin sends the person you are talking to a random quote. Extra arguments can be added such as -s and -o."
depends=('amsn' 'fortune-mod')
arch=('any')
conflicts=('amsn-extras-svn')
license=('GPL')
groups=('amsn-plugins')
url="http://www.amsn-project.net/plugins.php#39"
_pluginname="fortune"
install=$pkgname.install
source=(http://downloads.sourceforge.net/amsn/$_pluginname-$pkgver.zip)
md5sums=('bede5b6b60aacef5d3717af598e58ccb')


build() {
  cd $srcdir/$_pluginname
 
  # Create destination directory
  install -d $pkgdir/usr/share/amsn/plugins/$_pluginname
  
  # Move .tcl and xml file
  install -m 0644 $srcdir/$_pluginname/{plugininfo.xml,$_pluginname.tcl} $pkgdir/usr/share/amsn/plugins/$_pluginname/
}

