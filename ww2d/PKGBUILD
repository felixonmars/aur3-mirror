#Contributor: mpie <michael.kyne-phillips1@ntlworld.com> 
 pkgname=ww2d
 pkgver=0.99.87
 pkgrel=1 
 pkgdesc="Java GL earthviewer" 
 url="http://ww2d.csoft.net"
 depends=('j2re' 'mesa' 'jogl')
 makepedpends=()
 source=(http://ww2d.csoft.net/files/$pkgname-$pkgver.zip) 
md5sums=('0bc522c42b22287b0400592a6dd7ff71')
 build() { 
cd $startdir/src/$pkgname-$pkgver
 mkdir -p $startdir/pkg/usr/share/ww2d
mkdir -p $startdir/pkg/usr/bin
mv 'Earth' 'Global' 'WW2D.jar' $startdir/pkg/usr/share/ww2d/
echo "java -jar /usr/share/ww2d/WW2D.jar" > $startdir/pkg/usr/bin/ww2d
chmod +x $startdir/pkg/usr/bin/ww2d
chmod 755 $startdir/pkg/usr/share/ww2d/*
 }
