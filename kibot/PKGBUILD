# Contributer: Andy Kiss <ratm@archlinux.us>

arch=('i686')
depends=('python')
license=('GPL')
pkgname=kibot
pkgdesc='Python-based IRC bot.'
url='http://linux.duke.edu/projects/kibot/'
pkgver=0.0.12
pkgrel=1
md5sums=('a99fa06169fcdba2f5d704fd3cdf65db')


source=(
"http://linux.duke.edu/projects/kibot/download/kibot-0.0.12.tar.gz"
)

build() {
	cd $srcdir/kibot-$pkgver
	./configure
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
