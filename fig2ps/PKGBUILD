pkgname=fig2ps
pkgver=1.5
pkgrel=3
pkgdesc="Perl script designed to convert Xfig files to postscript or PDF files, text is processed using LaTeX"
arch=('any')
url="http://$pkgname.sourceforge.net/"
license=('GPL')
depends=('perl>=5.8' 'texlive-bin' 'transfig' 'gv')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2 \
        ams_font.patch \
        bbox_dvips.patch)
backup=('etc/fig2ps/fig2ps.rc')
md5sums=('22ea30b5d0f36dfec7b462449b0fc82b'
         'bbed7da26e9520f0e9cf9e6bd8f25c76'
         '98fd72ade674dd20b745604b5ba079ca')

build() {
  cd $srcdir/$pkgname-$pkgver

  # patch the config file to also use amsfonts
  patch -Np0 -i $srcdir/ams_font.patch

  # patch the fig2ps script to use dvips to construct bounding 
  # boxes, this is needed to work with TeXLive 2008
  patch -Np0 -i $srcdir/bbox_dvips.patch

  make
}

package(){
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=$pkgdir/usr MANDIR=$pkgdir/usr/share/man ETCDIR=$pkgdir/etc/fig2ps install
}