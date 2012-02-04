pkgname=mytunet
pkgver=0.1.55
pkgrel=1
pkgdesc="MyTunet (Secu-Network Authorization System of Tsinghua University) Linux Client"
arch=('i686' 'x86_64')
url="http://www.mytunet.com/"
license=('custom')
source=(http://mytunet.googlecode.com/files/mytunet 
        mytunet.conf)
md5sums=('242f50e6a0c62c29e62ac7e0e5eeb9d7'
         '6e5a68876e366258b8340e29b52c1dfb')
build() {
	mkdir -p $pkgdir/usr/bin/
	install -m 755 $srcdir/mytunet $pkgdir/usr/bin/
    
    mkdir -p $pkgdir/etc/
    install -m 644 $srcdir/mytunet.conf $pkgdir/etc/
}
