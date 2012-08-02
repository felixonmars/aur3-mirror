# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Chris Charles chris (at) ccharles (dot) ca
pkgname=ppd-dell-mfp
_file_pkgver=1.19
pkgver=$_file_pkgver.A01
pkgrel=1
pkgdesc="PPD files for Dell multifunction printers (dp5330, mfp2335ps, mfp1815ps, dp1130n, mfp1135n, mfp2145ps, dp1130, mfp1133)"
arch=('i686' 'x86_64')
url="http://www.dell.com/support/drivers/us/en/19/Product/dell-mfp1135"
license=('custom')
groups=()
depends=('cups')
install=ppd-dell-mfp.install
changelog=
source=(http://downloads.dell.com/FOLDER00294749M/1/Dell1135n_Linux_v$_file_pkgver.tar.gz)
noextract=()
md5sums=(cab815beb19f5c385ae152170595a51a)

if [[ "$(uname -m)" == 'x86_64' ]]; then
  _filter_path='cdroot/Linux/x86_64/at_root/usr/lib64/cups/filter'
else
  _filter_path='cdroot/Linux/i386/at_root/usr/lib/cups/filter'
fi

package() {

  cd $startdir/src/cdroot

  install -d $pkgdir/usr/share/cups/model/Dell
  install -d $pkgdir/usr/lib/cups/filter

  install \
    $srcdir/cdroot/Linux/noarch/at_opt/share/ppd/dp5330.ppd \
    $srcdir/cdroot/Linux/noarch/at_opt/share/ppd/mfp2335ps.ppd \
    $srcdir/cdroot/Linux/noarch/at_opt/share/ppd/mfp1815ps.ppd \
    $srcdir/cdroot/Linux/noarch/at_opt/share/ppd/dp1130n.ppd \
    $srcdir/cdroot/Linux/noarch/at_opt/share/ppd/mfp1135n.ppd \
    $srcdir/cdroot/Linux/noarch/at_opt/share/ppd/mfp2145ps.ppd \
    $srcdir/cdroot/Linux/noarch/at_opt/share/ppd/dp1130.ppd \
    $srcdir/cdroot/Linux/noarch/at_opt/share/ppd/mfp1133.ppd \
    $pkgdir/usr/share/cups/model/Dell

  install \
    $srcdir/$_filter_path/libscmssc.so \
    $srcdir/$_filter_path/libscmssf.so \
    $srcdir/$_filter_path/pscms \
    $srcdir/$_filter_path/pstosecps \
    $srcdir/$_filter_path/rastertosamsungspl \
    $srcdir/$_filter_path/rastertosamsungsplc \
    $srcdir/$_filter_path/smfpautoconf \
    $pkgdir/usr/lib/cups/filter
}

# vim:set ts=2 sw=2 ETA:
