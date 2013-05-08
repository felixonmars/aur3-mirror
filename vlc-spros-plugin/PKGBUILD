# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=vlc-spros-plugin
_libname=libsrpos_plugin
pkgver=0.2
pkgrel=1
pkgdesc="Spros plugin allows you to automatically save and restore the position of the last 10 played files in the VLC player."
url="http://code.google.com/p/vlc-srpos-plugin/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('vlc')
optdepends=()
makedepends=('make' 'gcc')
conflicts=()
replaces=()
backup=()
# install='foo.install'
source=("http://vlc-srpos-plugin.googlecode.com/files/${_libname}-${pkgver}.tar.gz")
sha1sums=('04851b992c77b5f760965c60b9956f5bb5f1535d')

build() {
  cd "${srcdir}/${_libname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_libname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
