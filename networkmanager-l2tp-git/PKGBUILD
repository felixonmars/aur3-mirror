# Contributor: Nikolay Amiantov <nikoamia@gmail.com>
# Contributor: Artem Alabin <kirpicheff@yandex.ru>

pkgname=networkmanager-l2tp-git
pkgver=0.9.8.6.r0.g73a30d4
pkgrel=1
pkgdesc="L2TP support for NetworkManager"
arch=('i686' 'x86_64')
url="https://github.com/seriyps/NetworkManager-l2tp"
license=('unknown')
depends=('gtk3' 'gconf' 'libgnome-keyring' 'intltool' 'networkmanager' 
'xl2tpd')
optdepends=('openswan' 'ppp')
options=()
makedepends=('git')
provides=('networkmanager-l2tp')
conflicts=('networkmanager-l2tp')
source=("git+https://github.com/seriyps/NetworkManager-l2tp.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/NetworkManager-l2tp"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/NetworkManager-l2tp"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
    --libexecdir=/usr/lib/networkmanager \
    --with-pppd-plugin-dir=/usr/lib/pppd/2.4.6 \
    --enable-more-warnings=yes
  make
}

package() {
  cd "$srcdir/NetworkManager-l2tp"

  make DESTDIR="$pkgdir" install
}

