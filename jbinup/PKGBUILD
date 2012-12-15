pkgname=jbinup
pkgver=0.90_beta9_dailybuild831
pkgrel=1
pkgdesc="Java based client for uploading binary files to the Usenet"
arch=('any')
url="http://jbinup.com/en/"
license=('custom:freeware')
depends=('java-runtime')

source=("JBinUp_0.90_Beta_9_-_DailyBuild_831.jar::http://forum.jbinup.com/download/file.php?id=372"
	"jbinup.sh"
	"license.txt")
	
md5sums=('5bf9be6ce120fac6c6f2d398905a0b51'
         '94e279876f14ad94f4f064ed1f211feb'
         '9ae3e1d6b074756303a54ab6727ccbd4')

package() {
  cd "$srcdir/"
  install -Dm 644 "JBinUp_0.90_Beta_9_-_DailyBuild_831.jar" "$pkgdir/usr/share/java/jbinup/jbinup.jar"
  install -Dm 755 "jbinup.sh" "$pkgdir/usr/bin/jbinup"
  install -Dm 644 "license.txt" "$pkgdir/usr/share/licenses/jbinup/license.txt"
}

# vim:set ts=2 sw=2 et:
