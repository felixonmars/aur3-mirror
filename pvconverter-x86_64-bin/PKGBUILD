# Maintainer: Your Name <youremail@domain.com>
_pkgname=pvconverter
pkgname=$_pkgname-x86_64-bin
_distname=pvconverter_linux_64bit
pkgver=3.5
pkgrel=1
pkgdesc="Converts PCM (mono, 8 kHz, 16-bit) wave file to PureVoice qcp file and vice-versa."
arch=('x86_64')
url="http://www.qualcomm.com/products_services/mobile_content_services/voice/purevoice.html"
license=('custom')
depends=('glibc' 'libstdc++5')
changelog='ChangeLog'
source=("http://www.qualcomm.com/sites/default/files/downloads/purevoice/$_distname"_v"$pkgver.tar.gz"
        'LICENSE')
md5sums=('d1402f903fe77284f4e437049083efe7'
         '0de70a804ea56485f0976c19f80570d5')

package() {

  install -d $pkgdir/usr/{bin,share/licenses/$_pkgname}

  cd "$srcdir"
  install LICENSE "$pkgdir/usr/share/licenses/$_pkgname"
  install pvconv "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:

