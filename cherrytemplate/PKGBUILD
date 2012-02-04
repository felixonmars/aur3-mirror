# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=cherrytemplate
pkgver=1.0.0
pkgrel=3
pkgdesc="An easy and powerful templating module for Python"
arch=('i686')
url="http://cherrytemplate.python-hosting.com/"
license=("custom:BSD")
depends=('python')
source=(http://downloads.sourceforge.net/sourceforge/cherrypy/CherryTemplate-$pkgver.tar.gz COPYING)
md5sums=('eac64303fbadff0e7af942ef7028d48e' '3bf85b0228e504c4d124a1b1e6ccd6c4')

build() {
  cd $startdir/src/CherryTemplate-$pkgver
  python setup.py bdist_dumb || exit 1
  cd $startdir/pkg
  tar xzvf $startdir/src/CherryTemplate-$pkgver/dist/CherryTemplate-$pkgver.linux*.tar.gz
  install -D ../COPYING $startdir/pkg/usr/share/licenses/cherrytemplate/COPYING
}
