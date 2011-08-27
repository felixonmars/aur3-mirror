# Contributor: Anton Prins <uar at prinsonline dot demon dot nl>

pkgname=squeezeboxserver
pkgver=7.4.1
pkgrel=1
pkgdesc="Powerful streaming audio server from Slim Devices"
depends=(
# unknown to me, default arch install + openssh handles it
        )

source=(http://downloads.slimdevices.com/SqueezeboxServer_v${pkgver}/squeezeboxserver-${pkgver}.tgz
        $pkgname.rc
        $pkgname.conf.d
        )

url="http://www.slimdevices.com/pi_features.html"
license=('GPL')
arch=('i686' 'x86_64')
install=squeezeboxserver.install

#not sure how to handle the build number -28947?
build() {
cd $startdir/src/squeezeboxserver-${pkgver}-28947 || return 1

mkdir -p $startdir/pkg/home/squeezeboxserver || return 1
cp -a * $startdir/pkg/home/squeezeboxserver || return 1
install -D -m755 ../squeezeboxserver.rc $startdir/pkg/etc/rc.d/squeezeboxserver || return 1
install -D -m644 ../squeezeboxserver.conf.d $startdir/pkg/etc/conf.d/squeezeboxserver || return 1
mkdir $startdir/pkg/home/squeezeboxserver/prefs
}

md5sums=('fa65636e7df75ae7af884a2efa184639'
         '5e57982c257797badbf72c2ae04994f7'
         'aa65896541958e119e63ee7c96be39af')
