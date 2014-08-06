# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=ttf-skyhookmono_regular
_pkgname=skyhookmono_regular
pkgver=2
pkgrel=2
pkgdesc="Sky­hook­Mono is a care­fully hand­crafted mono­spaced type­face fam­ily. It is mod­ern, sturdy and reduced to the max yet refined and classy."
arch=('any')
license=('custom:EULA')
url="http://www.fontomtype.de/pages"
_url="http://www.fontomtype.de/reboot/resources/other/$_pkgname.zip"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=($_url)

md5sums=('ce781d2e59f7b949415eee54961af5b4')

build() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 *.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
