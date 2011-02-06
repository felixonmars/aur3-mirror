# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=python-myghtyutils
_pkgname=MyghtyUtils
pkgver=0.52
pkgrel=5
pkgdesc="Container and Utility Functions from the Myghty Template Framework"
arch=('i686' 'x86_64')
url="http://www.myghty.org/"
license=('MIT')
depends=('python2')
source=('http://cheeseshop.python.org/packages/source/M/MyghtyUtils/MyghtyUtils-0.52.zip')
md5sums=('a15cda5919509024245802f4028b1560')

build() {
  cd $srcdir/$_pkgname-$pkgver

  python2 setup.py bdist_dumb

  #Install license
  install -D LICENSE $pkgdir/usr/share/licenses/python-myghtyutils/COPYING

  _tarfile=$srcdir/$_pkgname-$pkgver/dist/$_pkgname-$pkgver.linux*.tar.gz

  cd $pkgdir
  tar xzvf $_tarfile

  #Remove wrong execute permissions from *.txt and PKG-INFO files
  tar tf $_tarfile | grep .txt | xargs chmod -x
  tar tf $_tarfile | grep PKG-INFO | xargs chmod -x
}

# vim:set ts=2 sw=2 et:
