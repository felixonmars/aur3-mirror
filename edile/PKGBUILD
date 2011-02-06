#Maintainter: JHeaton <jheaton at archlinux dot us>
#Contributor: Nathan O <ndowens04 at gmail dot com>

pkgname=edile
pkgver=0.2
pkgrel=2
pkgdesc="A basic but useful text editor targeting system administration and scripting"
arch=('any')
url="http://code.google.com/p/$pkgname"
license=('GPL')
depends=('python2' 'pygtk' 'pygtksourceview2')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.py 
        $pkgname-$pkgver.patch)
md5sums=('3fed667fec2a9256ef03a8a83eb03040'
         '47364da57a4b24c995ed89bafb69bb49')
build() {
	cd $srcdir
    patch < edile-0.2.patch
    install -Dm755 $pkgname-$pkgver.py "$pkgdir"/usr/bin/$pkgname
}
