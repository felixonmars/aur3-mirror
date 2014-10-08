# Maintainer: Daniil Bolsun <dan.bolsun@gmail.com>

pkgname=vagrant-deb
pkgver=1.6.5
pkgrel=2
pkgdesc="Vagrant from official DEB package. Used due to community/vagrant lacks some features like login and share."
arch=(i686 x86_64)
url="http://www.vagrantup.com/"
license=('MIT')
depends=()
makedepends=('binutils')
optdepends=('virtualbox: default VM provider')
provides=('vagrant')
conflicts=('vagrant' 'vagrant-git')
replaces=('vagrant')
options=(!strip staticlibs)
source=(https://dl.bintray.com/mitchellh/vagrant/vagrant_${pkgver}_${CARCH}.deb)
case "$CARCH" in
x86_64)
	sha256sums=('e2c7af6d032ac551ebd6399265cb9cb64402c9fb96a12289161b7f67afada28a')
	;;
i686)
	sha256sums=('78cd956742c3e4e9f5e7f31e8a318a1b0dee100aebb46c363a63cd6aa2059cb4')
	;;
esac

prepare() {
	cd "$srcdir"
	ar p vagrant_${pkgver}_${CARCH}.deb control.tar.gz | tar xzf -
	ar p vagrant_${pkgver}_${CARCH}.deb data.tar.gz | tar xzf -
}

check() {
	cd "$srcdir"
	md5sum -c md5sums || return 1
}

package() {
	cd "$srcdir"
	mv opt "$pkgdir/"
	mv usr "$pkgdir/"
}
