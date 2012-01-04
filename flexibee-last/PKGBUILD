# Contributor: Max Devaine <maxdevaine@gmail.com>

pkgname=flexibee-last
pkgver=x.x.x.x
pkgversion=`wget -qO- http://www.flexibee.eu/download/latest/version | cat`
pkgbasever=`echo $pkgversion |cut -f1,2 -d.`
pkgrel=1
pkgdesc="Accounting economic system for person and business. Server and client in one package. This package  is fully automated for installing last version from developer web -> low secured - not support md5sums !!!"
arch=('i686' 'x86_64')
url="http://www.flexibee.eu"
license=('WinStrom')
depends=('glibc')
conflicts=('flexibee winstrom-flexibee')
install=flexibee.install
source=("flexibee")
md5sums=('cac2f86b82117d63de48e48ca1dabed2')

wget -c http://download.flexibee.eu/download/$pkgbasever/flexibee-$pkgversion.tar.gz

build() {

cd ${startdir}/src/
tar xvfz ${startdir}/flexibee-$pkgversion.tar.gz
cd ${startdir}/src/flexibee-$pkgversion
rm -rf etc/init.d
mkdir etc/rc.d
cp ${startdir}/flexibee etc/rc.d/
mkdir -p ${startdir}/pkg/
mv * ${startdir}/pkg/
}
