# Maintainer: Nathan McBride <nomb85@comcast.net>
pkgname=splunk
pkgver=4.1.6
pkgrel=1
pkgdesc="Splunk is the world’s leading software used to monitor, report and analyze live streaming IT data as well as terabytes of historical data – located on-premises or in the cloud. More than 2,000 organizations in 74 countries use Splunk to gain valuable insights from their IT data to improve service levels, reduce IT operations costs, mitigate security risks, and drive new levels of operational visibility." 
arch=('i686' 'x86_64')
url="http://www.splunk.com"
license=('custom:SPLUNK SOFTWARE LICENSE AGREEMENT')
# groups=()
# depends=()
# makedepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
install=splunk.install
# changelog=
# noextract=()

if [ "$CARCH" = "i686" ]; then
    source=('splunk-4.1.6-89596-Linux-i686.tgz::http://www.splunk.com/index.php/download_track?file=4.1.6/linux/splunk-4.1.6-89596-Linux-i686.tgz&ac=&wget=true&name=wget&typed=releases')
    md5sums=('6a97a0f69f0d819987d20ef491947559')
elif [ "$CARCH" = "x86_64" ]; then
    source=('splunk-4.1.6-89596-Linux-x86_64.tgz::http://www.splunk.com/index.php/download_track?file=4.1.6/linux/splunk-4.1.6-89596-Linux-x86_64.tgz&ac=&wget=true&name=wget&typed=releases')
    md5sums=('4d73aa6c5cdc1b6343bc9e9dff968f67') 
fi

package() {
	   mkdir "$pkgdir/opt"
	   cp -a "$srcdir/splunk" "$pkgdir/opt/"
 	  }
