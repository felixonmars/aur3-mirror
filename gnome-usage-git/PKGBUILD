# Maintainer: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=gnome-usage
pkgname=$_pkgname-git
pkgver=0a9fa60
pkgrel=1
pkgdesc="A GNOME 3 application that can show the current resource usage of the system."
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgtop' "gtk3>=3.9.10" 'networkmanager')
makedepends=('git' 'yelp-tools' 'intltool' 'vala')
options=(!emptydirs)
url="https://github.com/stfacc/gnome-usage"
groups=('gnome')
replaces=('gnome-usage')
provides=('gnome-usage')
conflicts=('gnome-usage')
install=gnome-usage.install
source=("git+https://github.com/stfacc/gnome-usage.git")
sha256sums=('SKIP')

pkgver()
{
  cd  "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd  "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --disable-schemas-compile
  make
}

package() {
  cd  "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
