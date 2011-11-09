pkgname=connectaddin
pkgver=9.4.81.0
pkgrel=1
arch=('x86_64')
pkgdesc="Adobe Connect Add-in"
url="http://www.adobe.com"
license=('')
depends=('curl')
makedepends=('deb2targz')
replaces=()
conflicts=()
provides=()
license=('custom')
source=('http://download.adobe.com/pub/connect/updaters/meeting/addin/adobe_connect_addin_lin64_r81.deb')
install="connectaddin.install"
md5sums=('351a0bbcc692457c4356d0e39fa504a9')

build() {
deb2targz adobe_connect_addin_lin64_r81.deb
tar xzf adobe_connect_addin_lin64_r81.tar.gz
cp -r usr/ ${pkgdir}/usr
mkdir ${pkgdir}/usr/bin/
echo "#!/bin/bash" >> ${pkgdir}/usr/bin/connect-addin
echo "cd /usr/local" >> ${pkgdir}/usr/bin/connect-addin 
echo "./connectaddin" >> ${pkgdir}/usr/bin/connect-addin 
chmod +x ${pkgdir}/usr/bin/connect-addin
}
