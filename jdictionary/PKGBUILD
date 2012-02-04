# Contributor: Gabor Nyekhelyi (n0gabor) <n0gabor@vipmail.hu>

pkgname=jdictionary
pkgver=1.8
pkgrel=1
pkgdesc="jDictionary is a plugin based dictionary"
depends=('j2re')
makedepends=('zip')
source=(http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-1_8.zip \
    $pkgname.sh $pkgname.png $pkgname.desktop)
url="http://jdictionary.sourceforge.net"
md5sums=('772db6e0e65eb987318d6878d0796a9c' \
	  'c553ed8a5a41b81b105a350ccd96a0de' \
	  '85d3df123e2d425370d39e5e5f99290e' \
	  'cf1c5828144df48254947b5211def1ad')

build() {
   mkdir -p $startdir/pkg/usr/share/jdictionary
   mkdir -p $startdir/pkg/usr/bin
   mkdir -p $startdir/pkg/usr/share/pixmaps
   mkdir -p $startdir/pkg/usr/share/applications
   
   cp $startdir/src/$pkgname/* $startdir/pkg/usr/share/$pkgname/
   cp $startdir/src/$pkgname.desktop $startdir/pkg/usr/share/applications
   cp $startdir/src/$pkgname.png $startdir/pkg/usr/share/pixmaps
   cp $startdir/src/$pkgname.sh $startdir/pkg/usr/bin/$pkgname
   
   chmod a+x $startdir/pkg/usr/bin/$pkgname
}

