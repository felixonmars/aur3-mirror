pkgname=vidyo
pkgver=3.3.0.127
pkgrel=1
pkgdesc="Desktop client for vidyo conferencing system"
url="https://demo.vidyo.com"
license=(commercial)
arch=(i686 x86_64)
depends=(alsa-lib qt4 libidn glu dialog)
optdepends=('zenity: Perform checks at start'
'flashplugin: Join meetings via web browser')

if [ "$CARCH" = "i686" ]; then
  debfilename="upload/VidyoDesktopInstaller-ubuntu-TAG_VD_3_3_0_127.deb"
  md5sums=('f27efab43741b9ac650d64970d318988')
elif [ "$CARCH" = "x86_64" ]; then
  debfilename="upload/VidyoDesktopInstaller-ubuntu64-TAG_VD_3_3_0_127.deb"
  md5sums=('f5045ce8514b13bae3f19e7075244036')
fi

source=("https://demo.vidyo.com/${debfilename}")

package() {
  bsdtar xf $srcdir/data.tar.gz -C "$pkgdir"
  rm -r ${pkgdir}/etc/xdg/autostart
}

