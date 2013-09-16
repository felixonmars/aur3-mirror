# Contributor: Rustam Tsurik <rustam@tsurik.org.ua>

pkgname=wordfast-pro
_name=wordfast-pro
pkgver=3.2.1
pkgrel=1
pkgdesc="Multiplatform translation memory(computer assisted translation) software."
url="http://www.wordfast.com/store_download.html"
license=('custom')
arch=('i686' 'x86_64')

if [ "$CARCH" = "i686" ]; then
  depends=('java-runtime')
elif [ "$CARCH" = "x86_64" ]; then
  # using 32bit jre, as this app won't start with 64bit java
  depends=('bin32-jre7-openjdk' 'lib32-gtk2');
fi

options=('!strip')
source=('wordfast-pro_'$pkgver'.tar.gz::http://cdn.wordfast.com/WFP_$pkgver/Wordfast_Pro_$pkgver.tar.gz'
	'wordfast.sh'
	'wordfast-pro.desktop')

md5sums=('6ca51b73d7e16bd58f44447c52b06652'
	 '0021647b06d6e3b878ed6e08089b4e99'
	 '85df9797aeee3cace7268c4775123954')

build() {
  echo "Nothing to do here"
}

package() {
  mkdir -p ${pkgdir}/opt/${_name}/
  mkdir -p ${pkgdir}/usr/share/icons/
  mkdir -p ${pkgdir}/usr/share/applications
  cd $srcdir/Wordfast/
  cp -a .eclipseproduct configuration icon.xpm features plugins Wordfast Wordfast.ini workspace ${pkgdir}/opt/${_name}/
  cp -a icon.xpm ${pkgdir}/usr/share/icons/wordfast.xpm
  cp ${srcdir}/wordfast.sh ${pkgdir}/opt/${_name}/
  chmod +x ${pkgdir}/opt/${_name}/wordfast.sh
  cp ${srcdir}/wordfast-pro.desktop ${pkgdir}/usr/share/applications
}
