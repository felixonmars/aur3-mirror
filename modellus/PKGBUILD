# Maintainer: ifaigios <ifaigios_at_gmail_dot_com>

pkgname=modellus
pkgver=4.01
pkgrel=1
pkgdesc="Interactive modelling with mathematics"
arch=('any')
url="http://modellus.fct.unl.pt/"
license=('CCPL') # CC-BY-NC-ND
depends=('java-runtime' 'xdg-utils' 'desktop-file-utils' 'hicolor-icon-theme' 'gtk-update-icon-cache')
install="$pkgname.install"
source=("http://archlinuxgr.tiven.org/sources/${pkgname}-${pkgver}-source.zip"
        # http://modellus.fct.unl.pt/file.php/37/Jar_files_for_MacOS_and_Linux_with_examples/Modellus_4.01.zip
        # Modellus's web-based source download is incompatible with makepkg
        # Source has been placed on Arch Linux Greece server instead
        "$pkgname.sh"
        "$pkgname.png"
        "$pkgname.desktop")
md5sums=('9948bec3907432877bb4458eea09bea3'
         '5a86948c6256b71edd88d61d3ef846d3'
         '0732a64ecc254e47378c2fa3dc41994e'
         '1ada90ce4d8f5ecb92ffa88ed84d1488')

package() {
    # Installing application
  cd $srcdir
  install -Dm644 "Modellus#915.jar" $pkgdir/usr/share/java/$pkgname/modellus.jar
  install -Dm644 {substance,flamingo,substance-flamingo}.jar $pkgdir/usr/share/java/$pkgname/
  cp -r "$srcdir/Modellus files" $pkgdir/usr/share/java/$pkgname/

    # Installing launcher
  install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname

    # Installing icon
  install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png

    # Installing menu item
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
