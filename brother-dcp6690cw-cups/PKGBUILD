# Maintainer: Attila Sztupak <attila dot sztupak at gmail dot com>

pkgname=brother-dcp6690cw-cups
packager="Attila Sztupak <attila dot sztupak at gmail dot com>"
pkgver=1.1.2_2
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-6690CW multifunctional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('GPL2' 'custom:brother')
depends=('brother-dcp6690cw-lpr' 'cups')
makedepends=('rpmextract')
arch=('x86_64')
source=(
  "http://pub.brother.com/pub/com/bsc/linux/dlf/dcp6690cwcupswrapper-${pkgver/_/-}.i386.rpm"
)
md5sums=(
  'c73e492ff205035209967a884e93240f'
)
install='brother-dcp6690cw-cups.install'


build()
{
	cd "$srcdir"
  rpmextract.sh "dcp6690cwcupswrapper-${pkgver/_/-}.i386.rpm" || return 1
  sed -i 's|/etc/init.d/cups|/etc/rc.d/cupsd|g' $(find $srcdir -name cupswrapperdcp6690cw -type f)
}

package()
{
  cd "$srcdir"
  find . -type f | while read file
  do
    local newfile="${pkgdir}/${file}"
    install -DT "$file" "$newfile"
  done
}

