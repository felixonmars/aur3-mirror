# Contributor: Dave Nguyen <diendien@gmail.com>
# Modified from Gustavo Dutra's Vimperator PKGBUILD
pkgname=gdata-provider-nightly
license=("custom")
pkgver=20091208_03
_year=2009
_month=12
_day=08-03
pkgrel=2
pkgdesc="Allows bidirectional access to Google Calendar"
arch=('i686')
url="https://wiki.mozilla.org/Calendar:GDATA_Provider"
depends=("thunderbird" "lightning-nightly")
_fileName=gdata-provider.xpi
source=(ftp://ftp.mozilla.org/pub/calendar/lightning/nightly/$_year/$_month/$_year-$_month-$_day-comm-1.9.1/linux-xpi/$_fileName)
md5sums=('f6597ecd8192c63d1de9117108beb77e')
_thunderbirdVersion=$(thunderbird -v | awk '{gsub(/,/, "", $0); print $2}')
_extensionId="{a62ef8ec-5fdc-40c2-873c-223b8a6925cc}"
build() {
    cd $srcdir || return 1
    local dstdir=$pkgdir/usr/lib/thunderbird-$_thunderbirdVersion/extensions/$_extensionId
    install -d $dstdir || return 1
    cp -R * $dstdir || return 1
    rm $dstdir/$_fileName
}
