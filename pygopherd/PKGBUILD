# Maintainer: Fernando Jiménez Solano <fjim@sdfeu.org>
pkgname=pygopherd
pkgver=2.0.18.3
pkgrel=1
pkgdesc="A modern Gopher server and HTTP gateway."
install=$pkgname.install
arch=(any)
url="http://gopher.quux.org:70/devel/gopher/pygopherd"
license=('GPL')
depends=(python2)
makedepends=(python2 unzip git)
conflicts=()
replaces=()
backup=('etc/pygopherd/pygopherd.conf' 'etc/pygopherd/mime.types')
#source=("$pkgname-$pkgver.zip::https://nodeload.github.com/jgoerzen/pygopherd/zipball/debian/2.0.18.3" rc.pygopherd conf.patch)
source=(rc.pygopherd conf.patch)
#md5sums=('24b744fe105bcdc9d7dc7347af39117b' '6de9f63e5f6437d9b241e108576f2690' 'a9d4689c578a42dc9330dc8e9d67cc04')
md5sums=('6de9f63e5f6437d9b241e108576f2690' 'a9d4689c578a42dc9330dc8e9d67cc04')



build() {
    echo "Cloning from git but checking out the stable version..."
    cd $startdir/src/$pkgname 2>/dev/null || git clone https://github.com/jgoerzen/$pkgname.git && cd $startdir/src/$pkgname
    git checkout debian/$pkgver -q
    sed -i 's#^root = /var/gopher$#root = /srv/gopher#' $startdir/src/$pkgname/conf/pygopherd.conf
    mkdir -p $startdir/pkg/etc/rc.d
    cp $startdir/rc.pygopherd $startdir/pkg/etc/rc.d/pygopherd
    chmod +x $startdir/pkg/etc/rc.d/pygopherd
    cd $startdir/src/$pkgname
    python2 setup.py install -O2 --prefix=/usr --root=$startdir/pkg || return 1
}
