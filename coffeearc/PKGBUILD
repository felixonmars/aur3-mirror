# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=coffeearc
pkgver=0_75b
pkgrel=2
pkgdesc="Multi-format GUI Archiver"
arch=('any')
url="http://forge.simplana.de/projects/show/coffeearc"
license=('gpl')
depends=('java-runtime' 'sh')
source=(http://forge.simplana.de/attachments/download/20/Coffeearc_${pkgver}.zip ${pkgname}.sh)
noextract=(*.jar)
md5sums=('34ea0ab05c5dec7d075e067fb5dc0384'
         '00ab96f7c5bbfa737a3bef8737795441')
build() {
cd ${srcdir}/Coffeearc_${pkgver}  
install -d ${pkgdir}/usr/{share/java/${pkgname},bin}
cp -rf libs profiles plugin.mf coffeearc.mf ${pkgdir}/usr/share/java/${pkgname} 
install coffeearc.jar ${pkgdir}/usr/share/java/${pkgname}/coffeearc.jar
install -m755 ${srcdir}/coffeearc.sh ${pkgdir}/usr/bin/coffeearc

}
