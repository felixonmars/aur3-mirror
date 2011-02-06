# Contributor: fancris3 <fancris3 at aol.com>

pkgname=lilo-gfxmenu
pkgver=22.7_70
pkgrel=1
pkgdesc="A bootloader for Linux with gfxmenu patch from openSUSE"
arch=(i686)
license=(BSD)
url="http://lilo.go.dyndns.org"
backup=(etc/lilo.conf)
conflicts=('lilo')
depends=('device-mapper' 'gfxboot')
makedepends=('bin86')
install=lilo.install
options=(docs)
source=('http://site.n.ml.org/download/20050917182351/lilo/lilo-22.7.tar.gz' 'lilo.conf' \
'README.graphics' 'lilo-22.7-OPT.diff' 'lilo-22.7-sa.diff' 'QuickInst.diff' 'lilo-22.3.4-pdf.diff' \
'lilo-22.7-gfx.diff' 'lilo-22.7-vga_inst.diff' 'lilo-mount_by_persistent_name.diff' \
'mkrescue.diff' 'README.SuSE' 'lilo-22.3.4-tetex.dif' 'lilo-22.7-loop_dev.diff' 'lilo-22.7.diff')
md5sums=('565cda4cd5e7c740403ed91e0bdf15f6'   'a17bb11e76c06e2b4dd3b332e7ec8729'
                    'fd7cd918351348da2bf2e3a6606325d2'  'a8e2ad825c4b2a03df52f63f8656f10e'
                    'b70a10b3a844cdb556f3968ec255e119'  'afc036597351e264157889678070f3dd'
                    '3331e9fe76ecb8a7fcc6a0f70a98e7fb'     'bc668a7d5a1862803b85374deca7fe2e'
                    'cd6b6ca33e3177f5f3772d556a943eb6'   'a96e8c0661e5f7d14fbede114969cf3d'
                    '8729a3ecb78b89252a4037720172c5c9' '16f739f096c481a8f15c207612017922'
                    'dac35c52bc755818c70d9c8a46896a27'  '00a37aea39ee2105450333ed11604065'
                    'c85aef50945cbed654a628add51fc157')

build() {
  cd $startdir/src/lilo-22.7
#all patches it's form opensuse
#http://ftp.opensuse.org/pub/opensuse/distribution/SL-OSS-factory/inst-source/suse/src/lilo-22.7-70.src.rpm
  patch -Np1 -i ../lilo-22.7.diff  || return 1
  patch -Np1 -i ../lilo-22.7-loop_dev.diff  || return 1
  patch -Np1 -i ../lilo-22.7-vga_inst.diff  || return 1
  patch -Np1 -i ../lilo-22.7-sa.diff  || return 1
  patch -Np1 -i ../lilo-22.3.4-pdf.diff  || return 1
  patch -Np0 < ../lilo-22.7-gfx.diff  || return 1
  patch -Np0 < ../lilo-22.3.4-tetex.dif  || return 1
  patch -Np1 -i ../mkrescue.diff  || return 1
  patch -Np1 -i ../QuickInst.diff  || return 1
  patch -Np1 -i ../lilo-22.7-OPT.diff  || return 1
  patch -Np1 -i ../lilo-mount_by_persistent_name.diff
  make || return 1
  make ROOT=$startdir/pkg MAN_DIR=/usr/man install
  mkdir -p $startdir/pkg/etc
  cp $startdir/lilo.conf $startdir/pkg/etc/
  mkdir -p $startdir/pkg/usr/share/doc/lilo-gfxmenu
  cp ../README.* $startdir/pkg/usr/share/doc/lilo-gfxmenu
}
