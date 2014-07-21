# Maintainer: Tom BU <tom.bu@members.fsf.org>

pkgname=guide
pkgver=1.0.2
pkgrel=1
pkgdesc="The official IDE for the Chinese NOI/NOIP"
arch=("i686" "x86_64")
url="http://www.noi.cn/guide-10"
license=('GPL')
groups=('devel')
source=("guide.desktop"
	"http://gait.buaa.edu.cn/~zjb/GUIDE-1.0.2/GUIDE-1.0.2-ubuntu.tar")
sha1sums=("955f34aec682b0d3e9eb8abecad454df9b6e994e"
	"cb55e7753adf6c94659bd914534daa849ecc6a80")
depends=("xterm")

if [[ "$CARCH" == "x86_64" ]]
then
    depends+=("lib32-libpng12" "lib32-libsm" "lib32-libice" "lib32-libxi" "lib32-libxrender" "lib32-libxrandr" "lib32-freetype2" "lib32-libxext" "lib32-zlib" "lib32-glibc" "lib32-glib2" "lib32-gcc-libs" "lib32-util-linux" "lib32-bzip2" "lib32-libpng" "lib32-harfbuzz" "lib32-expat" "lib32-libxcb" "lib32-pcre" "lib32-libxau" "lib32-libxdmcp")
else
  depends+=("libpng12" "libsm" "libice" "libxi" "libxrender" "libxrandr" "freetype2" "libxext" "libx11" "zlib" "glib2" "gcc" "libutil-linux" "bzip2" "libpng" "harfbuzz" "glibc" "expat" "libxcb" "pcre" "libxau" "libxdmcp")
fi

optdepends=(
  'gdb: for debugging support'
  'fpc: for Free Pascal support')

package() {
  cd ${srcdir}/GUIDE-1.0.2-ubuntu
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/doc/GUIDE/html/images
  mkdir -p ${pkgdir}/usr/share/apis
  mkdir -p ${pkgdir}/usr/share/applications
  install -m 755 GUIDE ${pkgdir}/usr/bin/GUIDE
  install -m 755 lang_en.qm ${pkgdir}/usr/share/lang_en.qm
  install -m 644 apis/c.api ${pkgdir}/usr/share/apis/c.api
  install -m 644 apis/cpp.api ${pkgdir}/usr/share/apis/cpp.api
  install -m 644 apis/pascal.api ${pkgdir}/usr/share/apis/pascal.api
  install -m 644 apis/pascal-full.api ${pkgdir}/usr/share/apis/pascal-full.api
  install -m 644 doc/index.html ${pkgdir}/usr/share/doc/GUIDE/html/index.html
  install -m 644 doc/menu.html ${pkgdir}/usr/share/doc/GUIDE/html/menu.html
  install -m 644 doc/images/image003.png ${pkgdir}/usr/share/doc/GUIDE/html/images/image003.png
  install -m 644 doc/images/Manna.png ${pkgdir}/usr/share/doc/GUIDE/html/images/Manna.png
  install -m 644 ${srcdir}/guide.desktop ${pkgdir}/usr/share/applications
}

