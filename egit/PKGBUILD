# Maintainer: kkb110
pkgname=egit
pkgver=1.1
pkgrel=1
pkgdesc="An eclipse team provider for git"
arch=('any')
url="http://egit.eclipse.org/w/?p=egit.git;a=summary"
license=('custom:BSD')
depends=('eclipse>=3.6')
source=("http://download.eclipse.org/egit/site.zip")
md5sums=('c7e654d44eb6a132cdff30642296726a')
noextract=('site.zip')

build() {
  _dest="$pkgdir/usr/share/eclipse/dropins/$pkgname/eclipse"
  install -d $_dest
  cd $srcdir
  unzip site.zip
  find site -name '*source*' -exec rm {} \;
  mv site/* $_dest
}