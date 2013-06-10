# Contributor: Lucas Hermann Negri <kkndrox@gmail.org>
pkgname=openrpt
pkgver=3.3.0
pkgrel=2
pkgdesc="Free Open Source SQL Report Writer" 
arch=('i686' 'x86_64')
url="http://www.xtuple.com/openrpt" 
depends=('qt4')
license=(LGPL)
source=('http://switch.dl.sourceforge.net/project/openrpt/openrpt/3.3.0/openrpt-3.3.0-source.zip'
        'OpenReportsIcon48.png'
        'openrpt.desktop'
        )
md5sums=('f7d277f4c8e2bba1b9800381d4d0db3c'
         '30dd18d1eca27b2777b14a4d4774a669'
         'c60254f35917d41469330a894a581324'
         )

build() { 
        cd $srcdir/$pkgname-$pkgver-source
        
        Threads=1
	if [ `uname` == "Linux" ]; then
		Threads=`cat /proc/cpuinfo | grep processor | awk '{a++} END {print a}'`
	fi
        
        qmake-qt4
        make -j$Threads || return 1
}
package() {
        cd $srcdir/$pkgname-$pkgver-source
        mkdir -p $pkgdir/opt/openrpt
        install -Dm755 bin/* "$pkgdir/opt/openrpt"
        install -Dm644 $startdir/OpenReportsIcon48.png "$pkgdir/usr/share/pixmaps/OpenReportsIcon48.png"
        install -Dm644 $startdir/openrpt.desktop "$pkgdir/usr/share/applications/$pkgname.desktop" 
}