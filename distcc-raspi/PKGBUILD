## Maintainer Peerchemist - dx 1178 gmail

pkgname=('distcc-raspi')
pkgver=2014.11
pkgrel=4
pkgdesc="Distccd configured to use Raspbian crosstools"
arch=('i686' 'x86_64')
license=('GPL')
depends=('distcc' 'arm-linux-gnueabihf-raspi')
backup=("etc/conf.d/distccd-raspi.conf")
url=('https://github.com/peerchemist/Peerbox')
source=('distccd-raspi.conf'
	    'distccd-raspi.service')
install='distcc-raspi.install'
sha256sums=('278360c05182ed69634f7ea9ae45ffb45848d2f2380587ab766773a6c97e9e80'
            'd25c3401a00f0afcd95981ee9b4953529d7c704e56af96bd2718459ea34d92eb')

package() {

    ## install symlink to distccd
    install -d "${pkgdir}/usr/bin"
    ln -sf /usr/bin/distccd "${pkgdir}/usr/bin/distccd-raspi"

    # install services
    install -Dm0644 "${srcdir}/distccd-raspi.service" \
       "${pkgdir}/usr/lib/systemd/system/distccd-raspi.service"
    
    # install config
    install -Dm0644 "${srcdir}/distccd-raspi.conf" \
       "${pkgdir}/etc/conf.d/distccd-raspi.conf"
    
}

