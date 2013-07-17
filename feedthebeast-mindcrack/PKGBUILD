# Maintainer: Claudio Kozicky <claudiokozicky@gmail.com>
pkgname=feedthebeast-mindcrack
pkgver=8.3.2
_pkgver=8_3_2
pkgrel=1
pkgdesc="Server for Minecraft Feed the Beast mod pack Mindcrack"
arch=(any)
url="http://feed-the-beast.com"
license=('unknown')
depends=('java-runtime-headless' 'screen' 'expect' 'libcups' 'fontconfig')
backup=('etc/conf.d/mindcrack')
options=(emptydirs)
install=feedthebeast-mindcrack.install
# the download link changes every day
_datesum=$(echo -n "mcepoch1$(curl -s http://www.creeperrepo.net/getdate)" | md5sum | awk '{print $1}')
source=($pkgname-$pkgver.zip::http://www.creeperrepo.net/direct/FTB2/$_datesum/modpacks%5EMindCrack%5E$_pkgver%5EMindCrack_Server.zip
        mindcrackd
        mindcrackd.service
        mindcrackctl
        conf.mindcrack)
md5sums=('91a47aa2cf5b331493457f0eceb2b019'
         '8213c22a88d3c0a8eeceaeac4a50754e'
         'f5a3c20ad1f5509e9e821da1e88c500b'
         '36128fbd88f50f7f3e30bf6f5ee8d174'
         'cf35a077be6edcaaf15f6ef47e2abf76')
package() {
    install -Dm744 "$srcdir/mindcrackd"         "$pkgdir/usr/bin/mindcrackd"
    install -Dm744 "$srcdir/mindcrackctl"       "$pkgdir/usr/bin/mindcrackctl"
    install -Dm644 "$srcdir/mindcrackd.service" "$pkgdir/usr/lib/systemd/system/mindcrackd.service"
    install -Dm644 "$srcdir/conf.mindcrack"     "$pkgdir/etc/conf.d/mindcrack"

    install -d "$pkgdir/srv/mindcrack/backup"

    # remove unneeded files
    rm "$srcdir/conf.mindcrack"
    rm "$srcdir/$pkgname-$pkgver.zip"
    rm "$srcdir/mindcrackctl"
    rm "$srcdir/mindcrackd"
    rm "$srcdir/mindcrackd.service"
    rm "$srcdir/ServerStart.bat"
    rm "$srcdir/ServerStart.sh"

    # install remaining files
    find . -type d -exec install -d     {,"$pkgdir/srv/mindcrack/"}{} \;
    find . -type f -exec install -Dm644 {,"$pkgdir/srv/mindcrack/"}{} \;
}
