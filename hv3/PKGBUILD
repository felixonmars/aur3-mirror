# Contributor: Pavel Borzenkov <pavel.borzenkov@gmail.com>
# Contributor: rabyte <rabyte__gmail>

pkgname=hv3
pkgver=alpha15
pkgrel=2
pkgdesc="A minimalist web browser based on tkhtml3"
arch=('i686')
url="http://tkhtml.tcl.tk/hv3.html"
license=('custom')
depends=("tkhtml3=$pkgver" 'tkimg' 'sqlite3')
source=(http://tkhtml.tcl.tk/tkhtml3-alpha-15.tar.gz \
	hv3.sh)
noextract=(tkhtml3-alpha-15.tar.gz)
md5sums=('a4292e00007c20e5aeaabd2014d9ba93' 'fdf84db8c65fc6b85b3118019a7db596')

build() {
  cd $startdir/src

  # make sure no files from older builds are being copied
  rm -rf htmlwidget/
  tar -xf tkhtml3-alpha-15.tar.gz || return 1
  cd htmlwidget

  mkdir -p $startdir/pkg/usr/share
  cp -r hv/ $startdir/pkg/usr/share/hv3/

  install -m755 -D ../hv3.sh $startdir/pkg/usr/bin/hv3
  install -m644 -D COPYRIGHT $startdir/pkg/usr/share/licenses/hv3/COPYRIGHT

  # remove junk
  rm -rf $startdir/pkg/usr/share/hv3/CVS/
}
