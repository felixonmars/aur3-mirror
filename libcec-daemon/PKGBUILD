# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=libcec-daemon
pkgver=0.0.2
_gitver=703c54cdba714c6ecd3d4725a505ee50724c55fb
pkgrel=1
pkgdesc="A Linux daemon for connecting libcec to uinput. That is, using your TV to control your PC!"
url="https://github.com/julianxhokaxhiu/libcec-daemon"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL')
depends=('libcec' 'boost' 'log4cplus')
makedepends=('git')
source=("git://github.com/julianxhokaxhiu/libcec-daemon.git#commit=$_gitver"
        'libcec-daemon.service')
md5sums=('SKIP'
         'dab0877e5523a538fbb95737bf686989')

build() {
  cd "${srcdir}/libcec-daemon"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/libcec-daemon"
  make DESTDIR="${pkgdir}" install

  # Install systemd service file
  install -d -m755 "${pkgdir}/usr/lib/systemd/system/"
  install -m644 "${srcdir}/libcec-daemon.service" "${pkgdir}/usr/lib/systemd/system/"
}