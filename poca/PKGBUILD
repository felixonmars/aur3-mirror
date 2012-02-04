# Contributor: Mads Michelsen <madchine@gmail.com>
pkgname=poca
pkgver=0.1.1
pkgrel=2
pkgdesc="A cron-friendly, disk-space-conscious, command line podcast aggregator, written in Python"
arch=('any')
url="http://code.google.com/p/poca/"
license=('GPL3')
depends=('python2>=2.5' 'python2-feedparser' 'urlgrabber' 'python-eyed3')
source=("http://poca.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('6a58ac15e6c471ec572283ce5d519990')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr
}

