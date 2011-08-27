pkgname=foldingathome-gpu-nvidia
pkgver=6.41
pkgrel=1
pkgdesc="Folding@Home gpu3 client for Nvidia cards"
arch=('x86_64')
url="http://folding.stanford.edu/"
license=('custom')
depends=('lib32-nvidia-utils>=256.40' 'lib32-cuda-toolkit' 'lib32-nvcuda' 'wine')
install=foldingathome-gpu.install
source=('http://www.stanford.edu/~friedrim/Folding@home-Win32-GPU_XP-641.zip'
 'foldingathome-gpu.conf'
 'foldingathome-gpu.rc.d')

build() {
  mkdir -p $startdir/pkg/opt/fah-gpu/
  mkdir -p $startdir/pkg/opt/fah-gpu/{alpha,bravo,charlie,delta,echo,foxtrot,golf,hotel}
  mkdir -p $startdir/pkg/etc/rc.d/
  mkdir -p $startdir/pkg/etc/conf.d/
  cd $startdir/src/
  install -m 755 Folding@home-Win32-gpu.exe $startdir/pkg/opt/fah-gpu/
  rm -rf *.dll
  install -m 755 $startdir/foldingathome-gpu.rc.d $startdir/pkg/etc/rc.d/foldingathome-gpu
  install -m 644 $startdir/foldingathome-gpu.conf $startdir/pkg/etc/conf.d/foldingathome-gpu
}
md5sums=('9ebca50f5ac714ce8fda5355a637027b'
         'bf1d79a61637aa38d5113230be4b9cc0'
         'dae5473706ae88d102c01c6fc59fbc4f')
