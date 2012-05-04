# Maintainer: dryes <joswiseman@gmail>
pkgname='rescene-bin'
pkgver=1.2
pkgrel=1
pkgdesc='ReScene is a mechanism for backing up and restoring the metadata from RAR files.'
url='http://rescene.com/index.htm'
arch=('any')
license=('Custom')
depends=('mono')
makedepends=('unrar')
source=('http://dl.dropbox.com/u/7803404/srr.1.2.rar' 'srr.sh')
noextract=('srr.1.2.rar')
provides=('rescene')
md5sums=('7246fce9dda0df1151a2cf7c81d35ea9' 'd5842a9d74dfcaa1632a22a1ee468fc6')

package() {
  mkdir -p "${pkgdir}/opt/rescene"
  unrar e 'srr.1.2.rar' "${pkgdir}/opt/rescene"
  install -D -m755 "${srcdir}/srr.sh" "${pkgdir}/usr/bin/srr"
  install -D -m744 "${pkgdir}/opt/rescene/license.txt" "${pkgdir}/usr/share/licenses/rescene-bin/license.txt"
  rm "${pkgdir}/opt/rescene/license.txt"
}
