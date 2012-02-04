pkgname=viewstl
pkgver=2004_11_18
pkgrel=1
pkgdesc="Viewstl is an open source way to view Stereo Lithography Files as
shaded on-screen images."
arch=('i686' 'x86_64')
url="http://ftp.vim.org/vim/runtime/spell/"
license=('GPL')
depends=()
makedepends=()
source=('http://downloads.sourceforge.net/project/viewstl/viewstl-binaries/all-current/viewstl-binaries.tar.gz')

md5sums=(87d5c719e0db3bf071324c896fdbd147)

build() {
  install -Dm755 $startdir/src/viewstl-binaries/linux/viewstl $startdir/pkg/usr/bin/viewstl 
}
