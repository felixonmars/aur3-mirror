# Maintainer: BorgHunter <borghunter at gmail>

pkgname=simutrans-pak96comic
_pkgname=simutrans
pkgver=110.0
pkgrel=1
pkgdesc="A high resolution graphics set with a comic styling for Simutrans"
arch=('any')
depends=('simutrans-pak64')
url="http://www.simutrans.com/"
license=('PerlArtistic')
source=(http://sourceforge.net/projects/$_pkgname/files/pak96.comic/pak96.comic%20for%20110-0-1/pak96.comic-0.4.10.zip/download)
md5sums=('295ead87998abfcb255f888915f82d8e')

build() {
  cd "$srcdir"/$_pkgname

  # install data
  install -m755 -d "$pkgdir"/usr/share/$_pkgname
  cp -rf ./* "$pkgdir"/usr/share/$_pkgname/

  # set permissions
  find "$pkgdir"/usr/share/$_pkgname -type d -exec chmod 755 {} +
  find "$pkgdir"/usr/share/$_pkgname -type f -exec chmod 644 {} +
}
