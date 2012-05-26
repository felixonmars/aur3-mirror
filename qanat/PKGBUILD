# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=qanat
pkgver=0.5
pkgrel=1
pkgdesc="A vertical shoot-em-up inspired by the classic Galaxian"
arch=('any')
url="http://perpetualpyramid.com/drupal/?q=qanat_game"
license=('GPL3')
depends=('python-pygame' 'python2-numpy')
source=("http://perpetualpyramid.com/$pkgname-$pkgver.tar.gz"
         $pkgname.png $pkgname.desktop)
md5sums=('d1262cc3a1f253126b0e139bd9aa69a0'
         '488df7b646b4b6a46b16a6ec9b66a345'
         '55eac085ac8e62273d70cfa337c6fb8c')

build() {
	cd $srcdir/$pkgname-$pkgver
	mkdir -p $pkgdir/usr/{bin,share/{$pkgname,applications,icons}}
	cp -r $pkgname.py design fonts game graphics music serge sound $pkgdir/usr/share/$pkgname
	echo -e "#!/bin/sh\ncd /usr/share/$pkgname\npython2 $pkgname.py -F" >> $pkgdir/usr/bin/$pkgname
	chmod 755 $pkgdir/usr/bin/$pkgname
    install -m644 -D $srcdir/$pkgname.png $pkgdir/usr/share/icons
	install -m755 -D $srcdir/$pkgname.desktop $pkgdir/usr/share/applications
}
