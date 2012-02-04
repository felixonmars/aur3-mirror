# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=babiloo
pkgver=2.0.11
pkgrel=2
pkgdesc="Babiloo is an open source free OS independent dictionary application that works in offline mode."
url="http://www.babiloo-project.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2' 'python2-qt') 
source=(http://launchpad.net/babiloo/trunk/$pkgver/+download/babiloo-$pkgver.tar.gz)
md5sums=('c384c6874590517515a20d8530b85ab1')

build() {

    cd $startdir/src/$pkgname-$pkgver

    #fix python version
    sed -i 's|python|python2|g' run.py

    # install desktop file
    install -dv $startdir/pkg/usr/share/applications
    install -v -m644 babiloo.desktop $startdir/pkg/usr/share/applications/

    # install program file
    install -dv $startdir/pkg/usr/share/$pkgname/
    install -v -m644 run.py $startdir/pkg/usr/share/$pkgname/
    cp -R {core,dicts,images,qt} $startdir/pkg/usr/share/$pkgname/
    cp -R locale $startdir/pkg/usr/share/

    gzip babiloo.1
    install -dv $startdir/pkg/usr/share/man/man1
    install -v -m644 babiloo.1.gz $startdir/pkg/usr/share/man/man1/

    install -dv $startdir/pkg/usr/share/pixmaps
    cp images/babiloo64.png $startdir/pkg/usr/share/pixmaps/babiloo.png

    #iconos
#     install -dv $startdir/pkg/usr/share/icons/hicolor/{32x32,48x48,64x64}/apps
#     cp images/babiloo64.png $startdir/pkg/usr/share/icons/hicolor/64x64/apps/babiloo.png
#     cp $startdir/babiloo-32x32.png $startdir/pkg/usr/share/icons/hicolor/32x32/apps/babiloo.png
#     cp $startdir/babiloo-48x48.png $startdir/pkg/usr/share/icons/hicolor/48x48/apps/babiloo.png

    # install bin file
    install -dv $startdir/pkg/usr/bin
    ln -s ../share/babiloo/run.py $startdir/pkg/usr/bin/babiloo
    chmod +x $startdir/pkg/usr/bin/babiloo

}
