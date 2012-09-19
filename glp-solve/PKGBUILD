#Package mantained by Jorge Pizarro Callejas, aka Jorgicio <jpizarro@inf.utfsm.cl>
pkgname=glp-solve
pkgver=1.2
pkgrel=1
pkgdesc="A graphic interface for the LP-Solve Software for resolving Linear Program problems"
arch=("i686" "x86_64")
license=("GPL")
url="http://carleos.epv.uniovi.es/~juan/"
md5sums=("09644e3b28c9841475ae9fd3621311cd")
depends=("lpsolve" "libgnomeui" "gtksourceview1" "libsm")
source=("http://debian.ues.edu.sv/compartidos/neozerosv/software-linux/GLP-Solve-1.2.tar.gz")

build(){
    cd $srcdir/GLP-Solve-1.2
    liblpsolve_CFLAGS=-I/usr/include/lpsolve liblpsolve_LIBS="-llpsolve55" ./configure --prefix=/usr --docdir=/usr
    make || return 1
    make DESTDIR="$pkgdir/" install
    mkdir -p $pkgdir/usr/share/applications
    cp $pkgdir/usr/share/gnome/apps/Utilities/GLP-Solve.desktop $pkgdir/usr/share/applications/
}
