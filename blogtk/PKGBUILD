# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Maintainer: zertyz <zertyz 2 gmail>

pkgname=blogtk
pkgver=2.0
pkgrel=6
pkgdesc="BloGTK is a client for weblog systems like Blogger, WordPress, and Movable Type."
arch=('i686' 'x86_64')
url="https://launchpad.net/blogtk"
license=('apache')
depends=('pywebkitgtk' 'python2-gdata' 'gnome-python' 'python2-feedparser' 'pygtksourceview2' 'gtkspell' 'pygtk' 'python2-gtkspell') 
md5sums=('f7fd77db6a8ba92898c03ef35f658e6f')
source=("http://launchpad.net/$pkgname/$pkgver/$pkgver/+download/$pkgname-$pkgver.tar.gz")

build() {
	cd $startdir/src/$pkgname-$pkgver
	sed -i -e 's/python/python2/g' ${srcdir}/${pkgname}-${pkgver}/bin/blogtk2
}

package(){
	cd $startdir/src/$pkgname-$pkgver
	make install PREFIX=$pkgdir/usr || return 1
}
