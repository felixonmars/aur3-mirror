# Maintainer: NgoHuy <severus@theslinux.org>


pkgname=hunspell-vi
pkgver=201305
pkgrel=1
pkgdesc="Vietnamese dictionaries for Hunspell"
arch=('i686' 'x86_64')
url="https://code.google.com/p/hunspell-spellcheck-vi/"
license=('GPL3')
depends=('hunspell')
source=("https://hunspell-spellcheck-vi.googlecode.com/files/vi_VN.zip")
sha256sums=('28af9fd9964c721ddf11bfc1955bf0bc28cabd467bb7f89a6190446f5e68665d')

package() {
  cd $srcdir/
  install -D -m644 vi_VN.dic $pkgdir/usr/share/hunspell/vi_VN.dic
  install -D -m644 vi_VN.aff $pkgdir/usr/share/hunspell/vi_VN.aff
  
}

