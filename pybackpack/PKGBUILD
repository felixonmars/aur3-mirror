# Contributor: lp76 <l.peduto@gmail.com>
pkgname=pybackpack
pkgver=0.5.8
pkgrel=2
pkgdesc="A python/gtk backup application that uses rdiff-backup. So it can be run over ssh or other"
url="http://andrewprice.me.uk/projects/pybackpack/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('pygtk' 'gnome-python' 'rdiff-backup' 'python2' 'cdrkit')
optdepends=("nautilus-cd-burner: For backup to CD/DVD")
source=(http://andrewprice.me.uk/projects/pybackpack/download/$pkgname-$pkgver.tar.gz)
md5sums=('0c29e0fdce0121c2a1c62e87a472fd65')

build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --prefix=$pkgdir/usr
}

