pkgname=smoviedb
pkgver=0.80
pkgrel=1
pkgdesc="sMovieDB is a free software which will keep your movie database clean and ordered on a quick simple way"
url="http://smoviedb.sourceforge.net/"
license=('other')
arch=('any')
depends=('python' 'pyqt3' 'python-pysqlite')

source=('http://downloads.sourceforge.net/project/smoviedb/smoviedb-beta/80/smoviedb_0.80.tar.gz' 'smoviedb' 'smoviedb.desktop')

md5sums=('e4b6ba6816042f6f2dee741bd4da4510'
         '9ac90cca3304fbed7acc7e1a685fd233'
         '76ab13cd450370e468924251a18c4699')


build() {
    cd $srcdir
    
    mkdir -p $pkgdir/usr/share/smoviedb
    mkdir -p $pkgdir/usr/share/pixmaps
    mkdir -p $pkgdir/usr/share/applications

    install -Dm 755 smoviedb $pkgdir/usr/bin/smoviedb
    
    cp smoviedb.desktop $pkgdir/usr/share/applications/smoviedb.desktop
    
    cd $pkgname-$pkgver
    
    cp -r * $pkgdir/usr/share/smoviedb
    cp $srcdir/$pkgname-$pkgver/icons/smoviedb.png $pkgdir/usr/share/pixmaps
    
}

