pkgname=ispmanager-pro
pkgver=4.3.14.2
pkgrel=1
pkgdesc='ISPmanager-Pro'
arch=('i686' 'x86_64')
url='http://ispsystem.com/en/features/index.html'
license=('custom')
depends=('apache')
source=(
	http://download.ispsystem.com/Linux-cc6/${CARCH}/ISPmanager-Pro/install.tgz
)

md5sums=('18c56e2caa185cb4f3f9a9de8e0ff6ea')

if [ "$CARCH" = "x86_64" ]; then
	md5sums=('fa6c4bc783fed35d4c107bfe5dc21351')
fi

backup=()
install=ispmanager-pro.install

build() {
	mkdir -p $startdir/pkg/usr/local/ispmgr
	cp -Ra $startdir/src/* $startdir/pkg/usr/local/ispmgr
}
