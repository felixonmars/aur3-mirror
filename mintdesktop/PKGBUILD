# Maintainer: Ryan Peters <sloshy45 _AT_ sbcglobal _DOT_ net>
# Special thanks to the Linux Mint project; without them this tool would not exist.
pkgname=mintdesktop
pkgver=3.2.2
pkgrel=2
pkgdesc="Linux Mint's GNOME Desktop Configuration Tool"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/mintdesktop"
license=('GPL')
depends=('python' 'gnome-python-desktop' 'pygtk' 'mint-common')
optdepends=()
source=("${url}/${pkgname}_${pkgver}.tar.gz" "arch-patch.diff")
md5sums=('1137cf37ac208c04226561d19641fc39'
         'c959dba2ec2f4fd015940d0134def1e9')

build() {
  cd "$srcdir/${pkgname}"
  patch -Np0 -i $srcdir/arch-patch.diff
  cp -R usr $pkgdir/
}
# vim:syntax=sh
