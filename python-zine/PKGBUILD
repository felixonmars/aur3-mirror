# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Maintainer: Loren Copeland <thisisquitealongname@gmail.com>

pkgname=python-zine
pkgver=0.1.2
pkgrel=2
pkgdesc="Python weblog software"
arch=('i686' 'x86_64')
url="http://zine.pocoo.org/"
license=('custom')
depends=('python2' 'python2-werkzeug' 'python2-jinja' 'python2-sqlalchemy-0.5' 
'python-simplejson' 'python2-html5lib' 'python2-pytz' 'python-babel' 'python-lxml')
optdepends=('python-flup' 'fcgi')
source=("http://zine.pocoo.org/releases/Zine-$pkgver.tar.gz" 
	"configure")
md5sums=('ba1f08a2093f42c79e81fff25e5ef17c'
         'eadfb7db60a76d55d6f25230ce35cf08')

build() {
  cd $srcdir
  cp -f configure $srcdir/Zine-$pkgver/configure
  cd Zine-$pkgver
  ./configure --prefix=/usr --python=/usr/bin/python2.7 || return 1
  DESTDIR=$pkgdir make install || return 1
  install -D -m0644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
