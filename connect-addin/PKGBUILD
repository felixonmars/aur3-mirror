pkgname=connect-addin
pkgver=8.1
pkgrel=1
arch=('x86_64')
pkgdesc="Adobe Connect Add-in"
url="http://www.adobe.com"
license=('')
depends=('lib32-curl')
makedepends=('deb2targz')
replaces=()
conflicts=()
provides=()
license=('custom')
#source=(https://g-se.adobeconnect.com/common/addin/ConnectAddin.deb)
source=('http://download.adobe.com/pub/connect/updaters/meeting/addin/adobe_connect_addin_lin64_r81.deb')
#md5sums=('f44fcadd26fb782ca60212435297aae1')
md5sums=('351a0bbcc692457c4356d0e39fa504a9')

build() {
deb2targz ConnectAddin.deb
tar xzf ConnectAddin.tar.gz
cp -r usr/ ${pkgdir}/usr
mkdir ${pkgdir}/usr/bin/
echo "#!/bin/bash" >> ${pkgdir}/usr/bin/connect-addin
echo "cd /usr/local" >> ${pkgdir}/usr/bin/connect-addin 
echo "./connectaddin" >> ${pkgdir}/usr/bin/connect-addin 
chmod +x ${pkgdir}/usr/bin/connect-addin
}
