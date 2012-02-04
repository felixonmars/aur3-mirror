pkgname=fortune-mod-eo
pkgver=1
pkgrel=1
pkgdesc="Fortune cookies: Esperanto"
url="https://launchpad.net/ubuntu/+source/fortunes-eo"
license=('GPL2')
depends=('fortune-mod')
groups=('fortune-mods')
source=('https://launchpad.net/ubuntu/+archive/primary/+files/fortunes-eo_20020729-4.tar.gz')
arch=('any')
md5sums=('6982e3933abc476e7737611fa1b65f61')

build() {
  cd $srcdir/fortunes-eo-20020729

  mkdir eo || : ; cd eo
  iconv -f iso8859-3 -t utf-8 ../proverbaro > proverbaro
  strfile proverbaro

  dir=$pkgdir/usr/share/fortune/eo
  install -dm755 $dir
  install -m644 proverbaro* $dir
}
# vim: set ft=sh ts=2 et:
