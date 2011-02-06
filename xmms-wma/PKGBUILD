# Contributor: Musikolo <musikolo@hotmail.com> 
# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=xmms-wma
pkgver=1.0.5
pkgrel=5
pkgdesc="XMMS plugin for WMA audio files"
url="http://mcmcc.bat.ru/xmms-wma"
license=("GPL")
depends=('xmms')
arch=('i686' 'x86_64')
source=(http://rsync16.de.gentoo.org/files/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('5d62a0f969617aeb40096362c7a8a506')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  install -D libwma.so $pkgdir`xmms-config --input-plugin-dir`/libwma.so
}





