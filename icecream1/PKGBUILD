#Contributor: Anselmo L. S. Melo <anselmolsm @ gmail.com>

pkgname=icecream1
pkgver=0.9.7
pkgrel=4
pkgdesc="*This package includes a config file, following what other distros do.* Icecream takes compile jobs from your build and distributes it to remote machines allowing a parallel build on several machines."
url="http://en.opensuse.org/Icecream"
license="GPL"
depends=('gcc')
conflicts=('icecream')
backup=('etc/icecream.conf')
arch=('i686' 'x86_64')
install=icecream.install
source=(ftp://ftp.suse.com/pub/projects/icecream/icecc-$pkgver.tar.bz2 icecream-daemon icecream-scheduler-daemon icecream.conf)
md5sums=('c06900c2f4011428d0d48826a04f74fb'
	 'd4943e2ebf97efa9fabb70e0f31c712b' 
	 '8521e8f23df427d8a7e1f8481ba3d3e1'
	 '51aae781751a11d108e174352d6e739d'
	 )	 

build() {
        cd $startdir/src/icecc-$pkgver
        #make -f Makefile.cvs
        ./configure --prefix=/opt/icecream || return 1
        make || return 1
        make DESTDIR=$startdir/pkg install || return 1
        install -D -m755 ../icecream-daemon $startdir/pkg/etc/rc.d/icecream
        install -D -m755 ../icecream-scheduler-daemon $startdir/pkg/etc/rc.d/icecream-scheduler
        install -D -m755 ../icecream.conf $startdir/pkg/etc/icecream.conf
}

