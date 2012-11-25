# Maintainer: Attila Sztupak <attila dot sztupak at gmail dot com>

pkgname=brother-dcp6690cw-lpr
packager="Attila Sztupak <attila dot sztupak at gmail dot com>"
pkgver=1.1.2_2
pkgrel=1
pkgdesc="LPR driver for Brother DCP-6690CW multifunctional printer"
url="http://solutions.brother.com/linux/en_us/index.html"
license=('GPL2' 'custom:brother')
depends=('lib32-glibc')
makedepends=('rpmextract')
arch=('x86_64')
source=(
  "lpr.patch"
  "http://pub.brother.com/pub/com/bsc/linux/dlf/dcp6690cwlpr-${pkgver/_/-}.i386.rpm"
)
md5sums=(
  'fa3e827405adcbb8c106270226666717'
  'f25b11cdab6eb41ebfc5d0e8b0a750e9'
)
install='brother-dcp6690cw-lpr.install'


build()
{
	cd "$srcdir"
  rpmextract.sh "dcp6690cwlpr-${pkgver/_/-}.i386.rpm" || return 1
  patch -Np0 < lpr.patch || return 1
}

package()
{
  cd "$srcdir"
  find . -type f | while read file
  do
    local newfile="${pkgdir}/${file}"
    install -DT "$file" "$newfile"
  done

  mkdir -pm700 ${pkgdir}/var/spool/lpd
}

