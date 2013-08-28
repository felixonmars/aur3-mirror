#Mantainer: Marco Asa <marcoasa90 [at] gmail [dot] com>
#Contributor: Bart Broek <b_dot_broek_dot_bb_at_gmail_dot_com>
pkgname=fidocadj
pkgver=0.24.2
pkgrel=1
pkgdesc="A Java based CAD program for designing electronic circuit drawings and PCB schematic and routing"
arch=('any')
depends=('java-environment' 'xdg-utils' 'bash')
url="http://davbucci.chez-alice.fr/"
license=('GPL')
install=fidocadj.install
source=('http://download.sourceforge.net/fidocadj/files/fidocadj.jar'
'http://sourceforge.net/projects/fidocadj/files/misc/main-linux-package.tgz')
md5sums=('f7f3d2ff43e0edbde2e9f239ebe94868'
         'a7e66f1d610f6a129a41a65a48d368c5')
package() {
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/$pkgname/
    mkdir -p $pkgdir/usr/share/java/$pkgname/
    mkdir -p $pkgdir/usr/share/pixmaps/
    mkdir -p $pkgdir/usr/share/applications/
 
    install -m755 bin/fidocadj $pkgdir/usr/bin/
    install -m644 share/$pkgname/fidocadj.png $pkgdir/usr/share/$pkgname/
    install -m644 share/$pkgname/fidocadj-file.png $pkgdir/usr/share/$pkgname/
    install -m644 share/$pkgname/fidocadj-mime.xml $pkgdir/usr/share/$pkgname/
    install -m644 ../fidocadj.jar $pkgdir/usr/share/java/$pkgname/ 
    install -m644 share/applications/fidocadj.desktop $pkgdir/usr/share/applications/
    ln -s "/usr/share/$pkgname/fidocadj.png" "$pkgdir/usr/share/pixmaps/fidocadj.png"
}

