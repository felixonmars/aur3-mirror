# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=pyew-hg
pkgver=null.96.64a91c1ab328
pkgrel=1
pkgdesc="pyew - a python tool for static malware analysis"
arch=('any')
url="https://code.google.com/p/pyew/"
license=('GPLv2')
depends=('python2')
optdepends=('libemu' 'pylibemu' 'pil' 'python2-pillow' 'pygtk')
makedepends=('mercurial')
source=('hg+http://code.google.com/p/pyew/')
md5sums=('SKIP')
install="pyew.install"

pkgver() {
  cd pyew
  hg log -r . --template '{latesttag}.{latesttagdistance}.{node|short}\n'
}


package() {
  install -d ${pkgdir}/opt/pyew/
  cp -r pyew/* ${pkgdir}/opt/pyew/
  
}


# vim:set ts=2 sts=2 sw=2 et
