# Maintainer: moyamo <moyamodehacker@gmail.com>
# Contributor: tjwoosta <tjwoosta@gmail.com>

pkgname='pcw-hg'
pkgver=r180.86b211e3b0cc
pkgrel=1
pkgdesc="pcw uses inotify to monitor a directory tree (created by ii) and \
	open terminals running cw with the in and out files for each channel."
arch=('i686' 'x86_64')
url="https://bitbucket.org/emg/pcw"
license=('MIT')
depends=('ii' 'srw-hg')
makedepends=('mercurial')
provides=('pcw')
conflicts=('pcw')
install="$pkgname.install"
source=('pcw::hg+https://bitbucket.org/emg/pcw/')
sha256sums=('SKIP')

build() {
  cd pcw/
  make
}

pkgver() {
  cd pcw/
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd pcw/
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE \
	"$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -D -m755 extras/cw_color.sh \
	"$pkgdir/usr/bin/cw_color.sh"
  install -D -m755 extras/chat.sh \
	"$pkgdir/usr/bin/chat.sh"
  install -D -m755 extras/pcw_notify.sh \
	"$pkgdir/usr/bin/pcw_notify.sh"
} 
