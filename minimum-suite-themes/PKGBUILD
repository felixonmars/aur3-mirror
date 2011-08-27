#Maintainer: Erus <erus.iluvatar@gmail.com>

pkgname=minimum-suite-themes
pkgver=1
pkgrel=1
pkgdesc="4 nice themes"
arch=('any')
url="http://thibaut28.deviantart.com/art/Minimum-Suite-v-0-3-108620821"
license=('unknown')
depends=()
makedepends=()
optdepends=('allblack:A nice icon set')
source=()
md5sums=()

build() {
wget -O $pkgname.tar.gz --user-agent='Opera' http://www.deviantart.com/download/108620821/Minimum__Suite_v_0_3_by_thibaut28.gz
tar xf $pkgname.tar.gz
cd $srcdir/Minimum\ Suite/
tar xf MinimumBlackSuiteContrasted.tar.gz
tar xf MinimumBlackSuite.tar.gz
tar xf MinimumWhiteSuiteContrasted.tar.gz
tar xf MinimumWhiteSuite.tar.gz
install -d $pkgdir/usr/share/themes/
cp -R Minimum\ Black\ Suite $pkgdir/usr/share/themes/
cp -R Minimum\ Black\ Suite\ Contrasted $pkgdir/usr/share/themes/
cp -R Minimum\ White\ Suite $pkgdir/usr/share/themes/
cp -R Minimum\ White\ Suite\ Contrasted $pkgdir/usr/share/themes/
chmod -R 755 $pkgdir/usr/share/themes/
}
