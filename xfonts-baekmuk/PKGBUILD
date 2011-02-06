# Contributor: atie H. <atie.at.matrix_at_gmail_dot_com>

pkgname=xfonts-baekmuk
pkgver=2.2
pkgrel=1
pkgdesc="Baekmuk Korean fonts for X."
arch=('i686' 'x86_64')
url="http://kldp.net/projects/baekmuk"
license=('BSD')
depends=('xorg-font-utils')
install="$pkgname.install"
source=(http://kldp.net/frs/download.php/1428/baekmuk-bdf-$pkgver.tar.gz)
md5sums=(48c0405ffbdf45e1311a978b65b47f4c)

build() {
    cd $startdir/src/baekmuk-bdf-$pkgver/bdf/
    mkdir -p $startdir/pkg/usr/share/fonts/local

	for B in *.bdf; do \
	    BASE=`echo $B | sed -e s/.bdf//g`; \
	    echo "Making $BASE..."; \
	    bdftopcf $B | gzip -9c >$BASE.pcf.gz || exit 1; \
	done

	for P in *.pcf.gz; do \
		install -m644 $P $startdir/pkg/usr/share/fonts/local/;
	done
}


