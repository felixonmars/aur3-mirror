# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Mike Dacre <mike.dacre@gmail.com>
pkgname=globusconnectpersonal
pkgver=2.1.3
pkgrel=1
pkgdesc="Tool to create a personal endpoint for the Globus file transfer utility"
arch=('x86_64' 'i386')
url="https://support.globus.org/entries/24078973-Installing-Globus-Connect-Personal-for-Linux-Using-the-Command-Line"
license=('Apache')
depends=('python2')
optdepends=('tk' 'libltdl' 'tcllib')
source=("https://s3.amazonaws.com/connect.globusonline.org/linux/stable/globusconnect-latest.tgz")
noextract=()
md5sums=('5fd2f27a473ffbd026516c25b11fac8f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  perl -pi -e "s#^GC_DIR=.*#GC_DIR=\'/opt/$pkgname-$pkgver\'#" globusconnectpersonal
  perl -pi -e "s#/usr/bin/python#/usr/bin/python2#" *.py
  if [ "$CARCH" == 'i386' ]; then
    rm -rf 'gt_amd64'
  elif [ "$CARCH" == 'x86_64' ]; then
    rm -rf 'gt_i386'
  fi
}

package() {
  mkdir -p "$pkgdir/opt"
  mkdir -p "$pkgdir/usr/bin"
  cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/"
  cd "$pkgdir/usr/bin"
  ln -s "../../opt/$pkgname-$pkgver/globusconnectpersonal" "globusconnect"
}
