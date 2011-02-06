# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=ns-allinone
pkgver=2.34
pkgrel=1
pkgdesc="Ns is a discrete event simulator targeted at networking research. Ns provides substantial support for simulation of TCP, routing, and multicast protocols over wired and wireless (local and satellite) networks."
arch=('i686')
url="http://www.isi.edu/nsnam/ns/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::http://sourceforge.net/projects/nsnam/files/allinone/ns-allinone-2.34/ns-allinone-2.34.tar.gz/download"
        "gcc4.5.patch")
noextract=()
 
md5sums=('d85a24e917abbc39eeda7801bc678119'
         '934d1114ac3265f73d1449b334498527')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/gcc4.5.patch"
  sed -i 's/ln[ \t]\+-s[ \t]\+\$CUR_PATH/ln -s ../g' install
  ./install
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/opt"
  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/opt"
  msg ""
  msg "----------------------------------------------------------------------------------"
  msg ""
  msg "Please put /opt/$pkgname-$pkgver/bin:/opt/$pkgname-$pkgver/tcl8.4.18/unix:$pkgname-$pkgver/tk8.4.18/unix" 
  msg "into your PATH environment; so that you'll be able to run itm/tclsh/wish/xgraph."
  msg ""
  msg "IMPORTANT NOTICES:"
  msg ""
  msg "(1) You MUST put /opt/$pkgname-$pkgver/otcl-1.13, /opt/$pkgname-$pkgver/lib, "
  msg "    into your LD_LIBRARY_PATH environment variable."
  msg "    If it complains about X libraries, add path to your X libraries "
  msg "    into LD_LIBRARY_PATH."
  msg "    If you are using csh, you can set it like:"
  msg "		setenv LD_LIBRARY_PATH <paths>"
  msg "    If you are using sh, you can set it like:"
  msg "		export LD_LIBRARY_PATH=<paths>"
  msg ""
  msg "(2) You MUST put /opt/$pkgname-$pkgver/tcl8.4.18/library into your TCL_LIBRARY environmental"
  msg "    variable. Otherwise ns/nam will complain during startup."
  msg ""
  msg ""
  msg "After these steps, you can now run the ns validation suite with"
  msg "cd ns-2.34; ./validate"
  msg ""
  msg "For trouble shooting, please first read ns problems page "
  msg "http://www.isi.edu/nsnam/ns/ns-problems.html. Also search the ns mailing list archive"
  msg "for related posts." 
  msg ""
}

# vim:set ts=2 sw=2 et:
   
