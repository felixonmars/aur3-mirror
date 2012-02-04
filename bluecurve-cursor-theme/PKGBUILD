# Contributor:  lh <jarryson#gmail.com>
pkgname=bluecurve-cursor-theme
pkgver=8.0.2
_version=5
pkgrel=7
pkgdesc="Fedora's Bluecurve X mouse cursor theme"
url="http://fedoraproject.org/"
arch=('any')
license=('GPL')
makedepends=('rpmextract')
source=(http://kojipkgs.fedoraproject.org/packages/bluecurve-icon-theme/$pkgver/$_version.fc12/noarch/$pkgname-$pkgver-$_version.fc12.noarch.rpm)

md5sums=('69f23fdce32034017e3a639df691339a')

build() {
	cd $srcdir
	rpm2cpio $pkgname-$pkgver-$_version.fc12.noarch.rpm | bsdtar -xf - -C $pkgdir
}
