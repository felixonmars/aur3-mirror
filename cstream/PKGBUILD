# Maintainer:   Lucky <archlinux@builds.lucky.li>
# Contributor:  Roberto Alsina <ralsina@kde.org>
# Author:       Martin Cracauer <cracauer@cons.org>

pkgname=cstream
pkgver=3.1.1
pkgrel=1
pkgdesc="A general-purpose stream-handling tool like UNIX dd"
url="http://www.cons.org/cracauer/cstream.html"
license=("custom")
arch=("i686" "x86_64")
source=("http://www.cons.org/cracauer/download/${pkgname}-${pkgver}.tar.gz")
md5sums=("4622adfa57e139a6299cf972dc6b76c2")
sha1sums=("8df4ca60af8647a08d0dbeb3f0fa660edfefc202")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/cstream/COPYING"
  make DESTDIR="${pkgdir}" install
}
