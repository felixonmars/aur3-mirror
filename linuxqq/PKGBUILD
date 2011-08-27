# Contributor: Andrew Fuller <qartis@gmail.com>
pkgname=linuxqq
pkgver=1.0.2
pkgrel=1
pkgdesc="Instant messaging software from Tencent Inc."
arch=(i686 x86_64)
url="http://im.qq.com/qq/linux/"
license=(custom)
if [[ ${CARCH} = 'x86_64' ]]; then
    depends=(
    'lib32-gtk2>=2.10'
    'lib32-atk'
    'lib32-cairo'
    'lib32-expat'
    'lib32-fontconfig'
    'lib32-freetype2'
    'lib32-gdk-pixbuf2'
    'lib32-libpng'
    'lib32-libx11'
    'lib32-libxau'
    'lib32-libxcb'
    'lib32-libxcomposite'
    'lib32-libxcursor'
    'lib32-libxdamage'
    'lib32-libxdmcp'
    'lib32-libxext'
    'lib32-libxfixes'
    'lib32-libxi'
    'lib32-libxinerama'
    'lib32-libxrandr'
    'lib32-libxrender'
    'lib32-pango'
    'lib32-pcre'
    'lib32-pixman'
    'lib32-zlib')
else
    depends=('gtk2>=2.10' 'libpng')
fi
options=(!strip)
source=('http://dl_dir.qq.com/linuxqq/linuxqq_v1.0.2_i386.tar.gz' 'qq')
md5sums=('7deac59adb6847fa61d22f5db99fd2f9'
         'e86451af7ef2d31ed4e614d73ec86e05')
provides=('qq')

package() {
  dir_name="linuxqq_v1.0.2_i386"
  rm $srcdir/$dir_name/QQLnk

  mkdir -p $pkgdir/usr/share/tencent/qq
  install -m755 $srcdir/$dir_name/qq     $pkgdir/usr/share/tencent/qq
  install -m644 $srcdir/$dir_name/res.db $pkgdir/usr/share/tencent/qq

  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/qq $pkgdir/usr/bin
}
