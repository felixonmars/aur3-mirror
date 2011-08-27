# Contributor: Travis Nickles <ryoohki7@yahoo.com>

pkgname=chextrek
pkgver=0.5
pkgrel=1
pkgdesc="Chex Quest-inspired mod for Doom 3"
url="http://xv15mods.com/hosted/chextrek/portal.php"
depends=('doom3')
makedepends=('unzip')
source=(http://www.doomwadstation.com/doom3tc/chextrekbeta_$pkgver.zip $pkgname.desktop \
$pkgname.sh)
md5sums=('a7af4c72f60911bfd2efac51afa8b569' '5fce07a075965f4b15153163480e16f1'\
                 '247e9cbbcfd4c5310dad4abec7c56bf9')

build() {
   cd $startdir/src
   mv chextrekbeta_$pkgver $pkgname
   install -m 755 $pkgname.sh $pkgname/$pkgname
   
   mkdir -p $startdir/pkg/opt/doom3 $startdir/pkg/usr/bin
   cp -r $pkgname $startdir/pkg/opt/doom3
   install -D -m 644 $pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop
   ln -sf /opt/doom3/$pkgname/$pkgname $startdir/pkg/usr/bin/$pkgname
}
