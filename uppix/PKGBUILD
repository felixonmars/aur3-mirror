# Maintainer: Erus <erus.iluvatar@gmail.com>

pkgname=uppix
pkgver=1337
pkgrel=1
pkgdesc="A command-line only version of pmd uppix.net uploader, without zenity dep"
url="http://pmdz.info/blog/index.php?29-envoyer-une-image-vers-pix-nofrag-en-2-clics"
arch=('any')
license=(BY-NC-SA)
depends=('curl')
source=(uppix.sh)
md5sums=('af39ccd42bc35cfd50ef7920b2f7cb9f')

build() {

  install -d $pkgdir/usr/bin/
  cp uppix.sh $pkgdir/usr/bin/
  ln -s $pkgdir/usr/bin/uppix.sh $pkgdir/usr/bin/uppix

}
