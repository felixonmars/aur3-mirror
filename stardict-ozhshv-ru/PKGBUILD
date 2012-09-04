# Maintainer: baobab<>heresiarch.info

pkgname=stardict-ozhshv-ru
pkgver=2.4.2
pkgrel=1
pkgdesc="Ozhegov & Shvedova russian explanatory dictionary in stardict format"
arch=('any')
url="http://sourceforge.net/projects/xdxf/"
license=('GPL')
optdepends=('stardict' 'goldendict')
source=(http://downloads.sourceforge.net/project/xdxf/dicts-stardict-form-xdxf/002a/stardict-comn_dictd04_ozhshv-2.4.2.tar.bz2)
md5sums=('d8870b701ba9de33caa81a69d133276a')

build() {
  cd "$srcdir/${pkgname/-ru}-$pkgver"
  mkdir -p $pkgdir/usr/share/stardict/dic/
  install -m 644 * $pkgdir/usr/share/stardict/dic/
}
