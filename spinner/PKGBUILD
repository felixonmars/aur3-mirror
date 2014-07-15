# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>

pkgname=spinner
pkgver=1.2.4
pkgrel=2
pkgdesc="Useful for keeping ssh/telnet links from dropping due to inactivity"
arch=('i686' 'x86_64')
source=(http://downloads.laffeycomputer.com/current_builds/${pkgname}/${pkgname}-${pkgver}.tar.gz)
url='http://www.laffeycomputer.com/spinner.html'
license=('GPL')
sha512sums=('4d5e0fdf441b32d9a326597ebc7b53a1adf71ec7477eab961f600f0820ecf6a80653eea56791edc13a4a728cbb9d6b4de60aeffcff0a836d3f3c7af5875fe411')
sha256sums=('13419c4410db739020532e0628e1b6f7321db102739f3b1b88f105b29a2fcbb2')
sha1sums=('920b9b2fbe385a95ad3712c15ddbf5ba83f12b3d')
md5sums=('21d5d1c5ae20104f0cd36fdf6b0daa71')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# eof
