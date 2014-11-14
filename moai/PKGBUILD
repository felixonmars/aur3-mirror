# Maintainer: Daniel T. Borelli < daltomi at aol >
# Only last stable branch 

pkgname=moai
pkgver=1.5.2
pkgrel=1
pkgdesc="Moai SDK is designed for mobile games, also run natively on Chrome browsers, Windows, Macintosh and Linux."
arch=('i686' 'x86_64')
url='https://github.com/moai/moai-dev/releases/tag/Version-1.5.2-binary-desktop'
license=('custom:CPAL')
depends=('mesa-libgl')
makedepends=('cmake')
install='moai.install'
_src_root="moai-dev-Version-$pkgver-binary-desktop/"

source=('UntzSystem.cpp.patch' 
        "https://github.com/moai/moai-dev/archive/Version-$pkgver-binary-desktop.tar.gz")

md5sums=('6cb2241379f5643d398c5b1e5f5c0892'
         'c3f43805a70841df262d937b64f31eda')


build() {
  cd $srcdir/$_src_root

# Patch fix audio
  cd $srcdir/$_src_root/3rdparty/untz/src/native/sdl/
  patch -p0 < $startdir/UntzSystem.cpp.patch

#Build  
  msg "Starting build..."
  cd $srcdir/$_src_root
  ./bin/build-linux-sdl.sh 
}

package() {
  
# Bin
  install -Dm755 "$srcdir/$_src_root/release/linux/host-sdl/x64/bin/moai" "$pkgdir/usr/bin/$pkgname"
  
# Docs
  guides_dir="$pkgdir/usr/share/doc/$pkgname/guides"
  install -d "$guides_dir"
  install -Dm755 "$srcdir/$_src_root/docs/guides/"{*.pdf,*.doc} "$guides_dir"

# Images
  images_dir="$pkgdir/usr/share/doc/$pkgname/attribution images"
  install -d "$images_dir"
  install -Dm755 "$srcdir/$_src_root/docs/attribution images/"*.png "$images_dir"

# Samples (If you want a small package comment these 3 lines)
  samples_dir="$pkgdir/usr/share/doc/$pkgname/samples"
  install -d "$samples_dir"
  cp -dpr "$srcdir/$_src_root/samples/"* "$samples_dir"

# Licenses
  lic_dir="$pkgdir/usr/share/licenses/$pkgname"
  install -d "$lic_dir"
  install -Dm644 "$srcdir/$_src_root/docs/license.txt" "$lic_dir"
  install -Dm644 "$srcdir/$_src_root/docs/legal.txt" "$lic_dir"

# 3rdparty licenses
  lic3rd_dir="$pkgdir/usr/share/licenses/$pkgname/3rdparty"
  install -d "$lic3rd_dir"
  install -Dm644 "$srcdir/$_src_root/3rdparty/LICENSE" "$lic3rd_dir"
}
