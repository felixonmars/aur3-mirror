# Contributor: pzykopilz <pzykopilz.at.w.eb.de>
# based on jfduke from rabyte <rabyte*at*gmail*dot*com>
pkgname=jfsw
pkgver=20051009
pkgrel=1
pkgdesc='An enhanced port of "Shadow Warrior"'
url="http://jonof.edgenetwork.org/?p=jfsw"
license=("GPL" 'custom:"build"')
depends=('sdl_mixer' 'gtk2')
makedepends=('nasm')
install=('jfsw.install')
source=(http://www.arcades3d.com/linux/${pkgname}_src_$pkgver.tar.bz2 \
	http://www.arcades3d.com/linux/jfbuild_src_$pkgver.tar.bz2 \
	http://www.mephisto.ma.cx/mephisto/patches/${pkgname}_src_$pkgver.patch \
	http://www.mephisto.ma.cx/mephisto/patches/jfbuild_src_$pkgver.patch \
	jfsw.png jfsw.desktop)
md5sums=('a0698bedecaefac9980081129f11ffcf' 'c9acb21dd1c3033a608581731b6fbc52' 'ee00f1bbec1a9054a0d8b81143a4ff94' 'b5db75643dd9034749f0a8766354c03b' 'c2675582d89ff9523d4d571daccffeb6' 'a046a35ce77c91206477db00c8783536')

build() {
  cd $startdir/src
  patch -Np0 < jfbuild_src_$pkgver.patch
  patch -Np0 < ${pkgname}_src_$pkgver.patch
  
  # fix compiler flags
  sed -i -e 's|pentium|i686|g' -e 's|-O1|-O2|g' \
    {jfbuild_src_$pkgver,${pkgname}_src_$pkgver}/Makefile

  ln -sf jfbuild_src_$pkgver build    
  cd ${pkgname}_src_$pkgver

  # fix filename and paths
  sed -i 's|SW.RTS|sw.rts|g' source/config.c
  sed -i 's|games/||g' source/{astub,game}.c

  make || return 1
  mkdir -p $startdir/pkg/usr/share/{applications,pixmaps,$pkgname}
  install -m755 -D sw $startdir/pkg/usr/bin/$pkgname
  install -m755 -D build $startdir/pkg/usr/bin/$pkgname-build
  install -m644 -D build.cfg $startdir/pkg/usr/share/$pkgname
  install -m644 -D ../$pkgname.png $startdir/pkg/usr/share/pixmaps
  install -m644 -D ../$pkgname.desktop $startdir/pkg/usr/share/applications
  install -m644 -D ../jfbuild_src_$pkgver/buildlic.txt \
    $startdir/pkg/usr/share/licenses/custom/build/buildlic.txt
}
