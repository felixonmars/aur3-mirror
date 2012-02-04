# Contributor: Nassim Kacha <nassim.kacha@gmail.com> 
pkgname=capivara
pkgver=0.8.9
pkgrel=2
pkgdesc="A graphical file transfer and file synchronization application. It supports network protocols such as SFTP and FTP"
arch=('i686' 'x86_64')
url="http://capivara.sourceforge.net"
license=('GPL2')
depends=('java-runtime')
makedepends=('unzip')
source=(http://ovh.dl.sourceforge.net/project/capivara/capivara/$pkgver/$pkgname-$pkgver-bin.zip capivara.desktop)
md5sums=('56c5af0dbd8f05677272eba13061aad6' '2708ebf92da005c191a45e159700d738')

build() {
   mkdir -p ${pkgdir}/usr/bin
   mkdir -p ${pkgdir}/usr/share/applications
   cp capivara.desktop ${pkgdir}/usr/share/applications/
   cp -r ${srcdir}/${pkgname}-${pkgver} ${pkgdir}/usr/share/${pkgname}-${pkgver}
   echo "java -jar /usr/share/${pkgname}-${pkgver}/capivara.jar" > $pkgdir/usr/bin/$pkgname
   chmod 755 $pkgdir/usr/bin/$pkgname
}
               
