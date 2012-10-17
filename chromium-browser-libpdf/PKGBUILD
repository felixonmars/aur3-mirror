# Contributor: Xiao Nan <road2stat@gmail.com> 

pkgname=chromium-browser-libpdf
pkgver=LATEST
pkgrel=2
pkgdesc="libpdf plugin for chromium-browser-bin"
url="http://wiki.archlinux.org/index.php/Chromium#libpdf.so"
arch=("i686" "x86_64")
license="non-free"
depends=('chromium-browser-bin')

case $CARCH in
  i686)   libpdf_arch="i386"  ;;
  x86_64) libpdf_arch="amd64" ;;
esac

build() {
  cd "$srcdir"

  wget "https://dl.google.com/linux/direct/google-chrome-unstable_current_$libpdf_arch.deb"

  bsdtar xvf "google-chrome-unstable_current_$libpdf_arch.deb" data.tar.lzma
  bsdtar xvf data.tar.lzma opt/google/chrome/libpdf.so

  install -Dm755 opt/google/chrome/libpdf.so "$pkgdir/opt/chromium-browser/libpdf.so"
}

