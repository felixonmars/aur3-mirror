# Contributor: Shadowhand <woody.gilk@gmail.com>
# Contributor: flori <Florian_Richter@gmx.de>
pkgname=python-htmldata
_pkgnameorig=htmldata
pkgver=1.1.1
pkgrel=1
pkgdesc="Extract and modify URLs in an HTML/XHTML/CSS document with Python"
url="http://www.connellybarnes.com/code/htmldata/"
license="Public Domain"
arch=('i686' 'x64')
depends=('python')
source=("http://www.connellybarnes.com/code/htmldata/$_pkgnameorig-$pkgver")
md5sums=('aa898ed7c73749873b91a209a06a43e7')
sha1sums=('11962420ea785b4d73539b65bcf4d1311e4302cc')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/lib/python2.4/site-packages
  cp $_pkgnameorig-$pkgver $startdir/pkg/usr/lib/python2.4/site-packages/$_pkgnameorig.py
}
