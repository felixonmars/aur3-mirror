# Maintainer: das-ich <das-ich@yandex.ru>

pkgname=k-encfs
pkgver=2.1
pkgrel=1
pkgdesc="K-EncFS is a frontend to the EncFS encrypting utility."
license=('GPL')
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/K-EncFS?content=54078"
depends=('python' 'pykde' 'pyqt' 'encfs' 'fuse')
install=k-encfs.install

source=(http://kde-apps.org/CONTENT/content-files/54078-K-EncFS.tar.bz2 k-encfs.patch)
md5sums=('177e78dfe557f4f56bf6f1c72eda6841' '657c05b3bf81e26ff2d955addff308ed')

build () {
  cd $startdir/src/K-EncFS
  tar xf kencfs2-2.1.tgz
  patch -p1 < ../k-encfs.patch
  cp -R opt $startdir/pkg
  cp -R usr/bin $startdir/pkg/opt/kde
  cp -R usr/local/lib $startdir/pkg/opt/kde
  rm $startdir/pkg/opt/kde/bin/kencfslink
  ln -s /opt/kde/lib/kencfs2/kencfs.py $startdir/pkg/opt/kde/bin/kencfslink
}
