# Maintainer: Hakim <acrox999[at]gmail[dot]com>
# Contributor: Joe Davison <joe.davison@ntlworld.com>
pkgname=gogdownloader
pkgver=1.0
pkgrel=3
arch=('any')
pkgdesc="A script (for linux) for downloading and for resuming the download of GoG games and their additional contents."
license=(WTFPL)
url="http://www.gog.com/en/forum/general/a_linux_downloader"
source=('http://www.xenon1170.com/it/sperosoft-downloads-it.html?download=3:gog-downloader')
install=${pkgname}.install
md5sums=('26d7a6661946dbee3bf037d2bade0938')

build()
{
  mkdir -p "${pkgdir}/usr/bin"
  cd "${srcdir}"
  mv GoGDownloader.sh gogdownloader
}

package() {
  cd ${srcdir}
  install -Dm755 gogdownloader "${pkgdir}/usr/bin"
}