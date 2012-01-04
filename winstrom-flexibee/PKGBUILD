# Contributor: Max Devaine <max@devaine.cz>

pkgname=winstrom-flexibee
pkgver=10.14.2.14
pkgrel=1
pkgdesc="Accounting economic system for person and business. This package is out of date, please use package "flexibee" !!! "
arch=('i686' 'x86_64')
url="http://www.winstrom.eu"
license=('WinStorm')
depends=('glibc')
install=flexibee.install
source=("http://www.winstrom.cz/download/10.14/flexibee-$pkgver.tar.gz"
        "flexibee")
md5sums=('40966b19fdcdaf4619087ef7de18ce94'
         'f6d813c2a70c49d59e8450cfba120df1')

build() {

cd ${startdir}/src/flexibee-$pkgver
rm -rf etc/init.d
mkdir etc/rc.d
cp ${startdir}/flexibee etc/rc.d/
mkdir -p ${startdir}/pkg/
mv * ${startdir}/pkg/
}
