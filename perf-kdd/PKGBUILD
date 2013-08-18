# Maintainer: Cory Giles <mail@corygil.es>

pkgname=perf-kdd
pkgver=5.00
pkgrel=1
pkgdesc="Compute machine learning performance metrics, as used in KDDCUP-2004."
conflicts=('perf')
arch=('i686' 'x86_64')
url="http://osmot.cs.cornell.edu/kddcup/software.html"
license=('custom')
source=(http://osmot.cs.cornell.edu/kddcup/perf/perf.src.tar.gz)
md5sums=('e168b70f7d96e4fdcdb9a7699599aeb8')

build() {
	cd "$srcdir/perf.src"
    rm -f perf
	make
    gzip perf.1 -c > perf.1.gz
    sed -n '/LICENSING/,/OF THE POSSIBILITY OF SUCH DAMAGES./p' \
        perf.c > LICENSE
}

package() {
	cd "$srcdir/perf.src"
    install -d $pkgdir/{usr/share/man/man1,usr/bin,usr/share/licenses/perf-kdd}
    install -t $pkgdir/usr/share/man/man1 perf.1.gz
    install -t $pkgdir/usr/share/licenses/perf-kdd LICENSE
    install -t $pkgdir/usr/bin perf
}
