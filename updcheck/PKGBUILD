# Contributor: test1000 <kfs1@online.no>
pkgname=updcheck
pkgver=0.7.1
pkgrel=1
pkgdesc="Shell script that checks a textfile with urls for changes and can show a colored diff, etc as update information"
arch=("i686" "x86_64")
url="http://idonthaveastinkingurl.com"
license=('unknown')
depends=('grep' 'sed' 'elinks' 'wget' 'sysvinit')
source=("updcheck")
build() {
  cd ${startdir}/src
  mkdir -p ${pkgdir}/usr/bin
  install ${startdir}/src/updcheck ${pkgdir}/usr/bin
}
md5sums=('8c9bd39d6d2236529c8f011c3cd93761')