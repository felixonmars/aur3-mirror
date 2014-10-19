#Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=qt-virustotal-uploader-git
pkgver=51.34ec9aa
pkgrel=1
pkgdesc="The official VirusTotal Uploader"
arch=("i686" "x86_64")
url=("https://github.com/VirusTotal/qt-virustotal-uploader")
license=("Apache")
depends=("c-vtapi-git")
makedepends=("git" "gcc" "qt5-base")
source=("git+http://github.com/VirusTotal/qt-virustotal-uploader.git")
md5sums=("SKIP")

pkgver() {
  cd qt-virustotal-uploader
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/qt-virustotal-uploader
  qmake 
  make
}

package() {
    
  install -D -m755 "${srcdir}/qt-virustotal-uploader/VirusTotalUploader" \
    "${pkgdir}/usr/bin/virustotaluploader"

}
