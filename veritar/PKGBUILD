# Maintainer:  Andrzej Zadrozny <azadrozny@gmail.com>

pkgname=veritar
pkgver=0.3.0
pkgrel=1
pkgdesc="VeriTAR [Veri(fy)TAR] is a command-line utility that verifies the md5 sums of files within a TAR archive."
arch=('i686' 'x86_64')
url="http://www.codetrax.org/projects/veritar"
license=('Apache License version 2')
depends=('python'
)
optdepends=(
)
source=("http://www.codetrax.org/attachments/download/27/$pkgname-$pkgver.tar.gz")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

md5sums=('1922af698ea438f435c4928675bb133b')
