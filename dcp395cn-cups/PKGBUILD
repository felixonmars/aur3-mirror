# Contributor: Lucjan Bryndza <lucck at boff dot pl>
pkgname=dcp395cn-cups
pkgver=1.1.3
pkgrel=2
pkgdesc="CUPS driver for Brother DCP-395CN printer"
arch=('i686' 'x86_64')
license=('custom:Brother Industries')
depends=('cups' 'tcsh')
makedepends=('rpmextract' 'findutils' 'sed')
if [ "$(uname -m)" = "x86_64" ]
then
    depends+=('lib32-glibc' 'psutils')
else
    depends+=('psutils')
fi
url="http://solutions.brother.com/linux/en_us/index.html"
install=brother-dcp395cn.install
source=(http://www.brother.com/pub/bsc/linux/dlf/dcp395cncupswrapper-1.1.3-1.i386.rpm
        http://www.brother.com/pub/bsc/linux/dlf/dcp395cnlpr-1.1.3-1.i386.rpm 
        fix_lp.patch)
md5sums=('1a500bd3250b98702aee1fb7bb0df84c'
         '99e710c8ab60f8f2d07c14477089069e'
         '213b95bad5059b38f4a3cb3c49fa022c'
         )

build() {
    cd "$pkgdir" || return 1
    for n in $startdir/src/*.rpm; do
        rpmextract.sh "$n" || return 1
    done
    mkdir -p var/spool/lpd
    patch -Np0 < $startdir/fix_lp.patch || return 1
    sed -i 's|/etc/init.d|/etc/rc.d|' $pkgdir/opt/brother/Printers/dcp395cn/cupswrapper/cupswrapperdcp395cn
}

