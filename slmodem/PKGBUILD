# $Id: PKGBUILD 83718 2013-02-04 16:57:17Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=slmodem
pkgver=2.9.11
pkgrel=70
pkgdesc="Drivers for the Smartlink winmodems. For stock arch kernel "
arch=(i686)
license=('custom:"Smartlink"')
url="http://linmodems.technion.ac.il/packages/smartlink/"
install=slmodem.install
depends=("linux" "slmodem-utils")
makedepends=("linux-headers")
source=(http://linmodems.technion.ac.il/packages/smartlink/slmodem-2.9.11-20110321.tar.gz
	kernel-3.8.1.patch)

md5sums=('e2b2217bb1727890dfa08ac65e4cf4ed'
	'f9f8fd8f24b124b151d60adcdb51aae0')

build() {
  _kernver=`pacman -Q linux | cut -d . -f 2 | cut -f 1 -d -`
  _depends=("linux>=3.${_kernver}" "linux<3.`expr ${_kernver} + 1`" "slmodem-utils")
  _kernverfull=`cat /lib/modules/extramodules-3.${_kernver}-ARCH/version`

  cd $srcdir/$pkgname-$pkgver-20110321
  patch -Np0 -i $srcdir/kernel-3.8.1.patch
  sed 's|^obj-m := slamr.o slusb.o|obj-m := slamr.o|' -i drivers/Makefile
  make KERNEL_DIR=/lib/modules/${_kernverfull}/build SUPPORT_ALSA=1 DESTDIR=$pkgdir drivers
}

package() {

  cd $srcdir/$pkgname-$pkgver-20110321
  install -D -m 644 drivers/slamr.ko $pkgdir/lib/modules/extramodules-3.${_kernver}-ARCH/slamr.ko

  sed -i "s|extramodules-.*-ARCH|extramodules-3.${_kernver}-ARCH|" $startdir/slmodem.install

  # license
  mkdir -p $pkgdir/usr/share/licenses/slmodem/
  cat >$pkgdir/usr/share/licenses/slmodem/license.txt <<EOF
******************************************************************************

TERMS AND CONDITIONS OF USE FOR SMART LINK LINUX SOFTWARE DRIVERS

By using the Linux software provided by Smart Link, YOU ARE CONSENTING TO
BE BOUND BY AND ARE BECOMING A PARTY TO THIS AGREEMENT. IF YOU DO NOT AGREE
TO ALL THE TERMS OF THIS AGREEMENT, PLEASE UNINSTALL THE SOFTWARE FROM YOUR
SYSTEM. For manufacturers, these Terms and Conditions modify the existing
Master Contract with Smart Link.

1. PRODUCT: Smart Link's product herein, (the "Product"), included as part
of this Linux driver package and as specified on Smart Link's website
www.smlink.com , comprises Smart Link's Linux software drivers (the
"Software") which are available for download by end-users and manufacturers
("Users")

2. LICENSE: The scope of the license granted herein shall be limited to
granting the User the right to download the Software from Smart Link's
website, free of charge, for the sole purpose of upgrading the User's
existing Smart Link chipset based modems ("Modems") in conjunction with
the User's right to use, make, reproduce, distribute and sublicense the
Software solely for distribution and support of the Modems and shall not
include the right to otherwise sell or sub-license the Software.

3. LIMITATION OF REMEDIES AND DAMAGES: In no event shall Smart Link or
any of the licensors, directors, officers, employees or affiliates of
the foregoing be liable to User for any direct, indirect, consequential,
incidental, special or similar damages whatsoever (including, without
limitation, damages for loss of business profits, business interruption,
loss of business information and the like), whether foreseeable or
unforeseeable, arising out of the use or inability to use the Software,
regardless of the basis of the claim and even if Smart Link or a Smart
Link representative has been advised of the possibility of such damage.
SOME JURISDICTIONS MAY NOT ALLOW THE LIMITATION OR EXCLUSION OF INCIDENTAL
OR CONSEQUENTIAL DAMAGES FOR CONSUMER PRODUCTS, SO THE ABOVE LIMITATIONS OR
EXCLUSIONS MAY NOT APPLY TO USER.

4. SOFTWARE CHANGES: Smart Link shall have the right, in its sole discretion,
without liability to User, to (a) change the design, or discontinue
developing, producing, licensing or distributing any Software covered by
this Agreement, and (b) announce new Software to which the terms and
conditions of this Agreement do not apply.

Signed: Smart Link, Ltd. , www.smlink.com
EOF
}
