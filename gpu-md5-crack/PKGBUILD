# Maintainer: Christos Nouskas <nous at archlinux dot us>
# 17 Jan 2010

pkgname=gpu-md5-crack
pkgver=0.2.3
pkgrel=2
_pkg=uploadFile?id=3
pkgdesc="NVidia CUDA GPU accelerated MD5 password crack tool"
arch=('i686' 'x86_64')
url="http://bvernoux.free.fr/md5/index.php"
license=('LGPL3')
depends=('cuda3-toolkit')
makedepends=('unzip')
options=('strip')
noextract=($_pkg)
source=(http://bvernoux.free.fr/md5/$_pkg
	common.mk.patch)	# for gcc-4.4
sha256sums=('4a59b6c3df7198480dea6181d5959c49d16ef0662362f6c70cd437cc56b36579'
            '2eb0b8a0760ab24e3297286dde2afe2b0810fbeddae02a69a3d33c0ef575b31d')

build() {
# extract
  cd $startdir
  ln -s $_pkg $pkgname-$pkgver.zip
  cd $srcdir
  mv $_pkg $pkgname-$pkgver.zip
  unzip -qojd $pkgname-$pkgver $pkgname-$pkgver.zip
  cd $srcdir/$pkgname-$pkgver
# build
  patch -p0 -i $srcdir/common.mk.patch
  make
# install
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $srcdir/$pkgname-$pkgver/bin/linux/release/gpu_md5_crack_$pkgver $pkgdir/usr/bin/$pkgname
  install -m 0644 $srcdir/$pkgname-$pkgver/[CINRU]*.txt $pkgdir/usr/share/doc/$pkgname
}
