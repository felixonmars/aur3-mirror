# Contributor : Kun Wang <ifreedom.cn@gmail.com>

pkgname="tmake(lua)"
_pkgname=tmake
pkgver=1.0
pkgrel=1
pkgdesc="TMake is multi-platform open-source build tool with support for many languages and toolkits, it is written in C++, but uses lua for configuration files to make it fast and lightweight!"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tmake"
license=('GPLv3')
depends=('lua')
source=("http://tmake.googlecode.com/files/$_pkgname-$pkgver-src.tar.gz" "install.patch")
md5sums=('62affc2c3ce67bf0863d25ed600ec7c9'
	 '457ccb292cd483d13b4a63bb113fbf82')

build() {
    mv -f "$srcdir/$_pkgname-$pkgver-src" "$srcdir/$_pkgname-$pkgver"
    cd "$srcdir/$_pkgname-$pkgver"
    patch < ../install.patch
    ./build.sh || return 1
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./install.sh "$pkgdir" || return 1
}

