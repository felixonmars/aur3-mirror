# Contributor: Dave Nguyen (Bladesonfire) <diendien@gmail.com>
pkgname=lightning-nightly
license=("custom")
pkgver=20091208_03
_year=2009
_month=12
_day=08-03
pkgrel=2
pkgdesc="Allows bidirectional access to Google Calendar"
arch=('i686')
url="https://wiki.mozilla.org/Calendar:GDATA_Provider"
depends=("thunderbird")
_fileName=lightning.xpi
source=(ftp://ftp.mozilla.org/pub/calendar/lightning/nightly/$_year/$_month/$_year-$_month-$_day-comm-1.9.1/linux-xpi/$_fileName)
md5sums=('59692fe0de5aa1650ff52eb1744f360b')
_thunderbirdVersion=$(thunderbird -v | awk '{gsub(/,/, "", $0); print $2}')
_extensionId="{e2fda1a4-762b-4020-b5ad-a41df1933103}"
build() {
    cd $srcdir || return 1
    local dstdir=$pkgdir/usr/lib/thunderbird-$_thunderbirdVersion/extensions/$_extensionId
    install -d $dstdir || return 1
    cp -R * $dstdir || return 1
    rm $dstdir/$_fileName
}
