pkgname=neoshineoffice3linux
pkgver=3.0
pkgrel=1
pkgdesc="Neoshine Office中标普华Office 3.0个人版"
arch=('any')
url="http://www.cs2c.com.cn/"
license=('GPL')
groups=('base')
makedepends=(rpmunpack)
depends=()
source=(ftp://ftp.cs2c.com.cn/neoshine/office/3.0.2/iso/${pkgname}.zip)
md5sums=('734c5869584b21a6ad547be0def36f50')
conflicts=()
install=neoshineoffice3linux.install
provides=('S2C')


build() {
	cd ${startdir}/src
        mkdir ${startdir}/pkg/opt
        tar xvzf NeoShineOffice3.0.tar.gz -C ${startdir}/pkg/opt/
        tar xvzf ${startdir}/usr.tar.gz -C  ${startdir}/pkg/
        #cp -rf ${startdir}/usr ${startdir}/pkg/
        mkdir ${startdir}/pkg/usr/share/fonts
        mv -f ${startdir}/pkg/opt/NeoShineOffice3.0/share/fonts/truetype ${startdir}/pkg/usr/share/fonts/
}