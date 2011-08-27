pkgname=opengl-tutors
pkgver=20110213
pkgrel=1
pkgdesc="A collection of opengl example programs"
arch=(x86_64 i686)
url="http://www.xmission.com/~nate/tutors.html"
license=('unknown')
depends=('freeglut' 'libgl')
source=(http://www.xmission.com/~nate/tutors/tutors-src.zip)
md5sums=('b586794ac73a02a92f3c73033b521658')

build() {
    cd $srcdir/tutors

    sed -i -e 's,^LDFLAGS =\(.*\) -lglu \(.*\)$,LDFLAGS = \1 -lGLU \2,' Makefile

    # fix the resources path
    for file in \
        fog.c glm.c lightmaterial.c lightposition.c projection.c shapes.c \
        texture.c transformation.c glm.h materials.h
    do
        sed -i -e "s,data/,/usr/share/$pkgname/," $file
    done

    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/$pkgname/

    for app in \
        fog lightmaterial lightposition projection \
        shapes texture transformation
    do
        cp $srcdir/tutors/$app $pkgdir/usr/bin/
    done

    cp $srcdir/tutors/data/*.{ppm,mtl,obj} $pkgdir/usr/share/$pkgname/
}
