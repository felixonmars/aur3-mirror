#Package maintained by Jorge Pizarro Callejas a.k.a. Jorgicio
# jpizarro [at] inf.utfsm.cl
# IMPORTANT: After installing this package, please copy the folder called poster into /usr/lib/python2.7/site-packages, by the following way (as root):
# cp -R /usr/lib/python2.6/site-packages/poster /usr/lib/python2.7/site-packages
#Enjoy Tumblring!
pkgname=opentumblr-client
pkgver=0.1.0
pkgrel=2
pkgdesc="An opensource Tumblr client made in Python"
arch=('i686' 'x86_64')
license=('LGPL3')
url="http://opentumblr.googlecode.com"
depends=('python2' 'wxgtk' 'python-simplejson' 'python-poster' 'wxpython')
source=(http://opentumblr.googlecode.com/files/$pkgname-$pkgver.tar.gz)
#source=($pkgname-$pkgver.tar.gz)
md5sums=('4cfc5f6a2213bcf8bc1ae359822f50bc')

build(){
    cd $srcdir/$pkgname-$pkgver
    mkdir -p $pkgdir/usr/share/doc/opentumblr
    mkdir -p $pkdir/usr/share/pixmaps
    python2 setup.py install --prefix=$pkgdir/usr/
    install -m644 $srcdir/$pkgname-$pkgver/images/opentumblr.png $pkgdir/usr/share/pixmaps
}
