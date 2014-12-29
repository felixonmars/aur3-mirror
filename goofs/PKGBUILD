pkgname=goofs
pkgver=0.7.3
pkgrel=1
pkgdesc=("goofs is filesystem in userspace, based on fuse, which aims to expose Google services such as picasa images, contacts, blogs, documents, spreadsheets, presentations, calendars, etc.")
url=("http://goofs.googlecode.com/")
arch=("any")
license=('unknown')
depends=()
makedepends=()
optdepends=('java-runtime: java support')
source=("http://goofs.googlecode.com/files/goofs-0.7.3.zip")
md5sums=('da3200aff4d214aaabf6e6028a24f6b7')
install='goofs.install'

package() {
  cd "${pkgdir}"
  mkdir -p opt/$pkgname
  mkdir -p usr/bin
  cp -r ${srcdir}/* opt/$pkgname/
  ln -s /opt/goofs/goofs-mount.sh usr/bin/goofs-mount
}

