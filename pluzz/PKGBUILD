# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=pluzz
pkgver=0.2
pkgrel=1
pkgdesc="Play video pluzz.fr with vlc"
arch=('any')
url="http://blog.rom1v.com/"
license=('wtfpl')
depends=('flvstreamer' 'vlc' 'wget')
source=(http://dl.rom1v.com/pluzz/$pkgname-$pkgver)
md5sums=('88835be5124fe766d03e7226e80b4cb4')

build() {
  cd ${srcdir}
  install -Dm 755 $pkgname-$pkgver "${pkgdir}/usr/bin/$pkgname" || return 1
}
