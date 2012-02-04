# Contributor: Frederik Alkærsig (FALKER) <havnelisten AT gmail.com>
#              Peter Hatina               <phatina     AT gmail.com>
pkgname=thinkfan-t410
pkgver=0.7
pkgrel=1
pkgdesc="A minimalist fan control program. Supports the sysfs hwmon interface and thinkpad_acpi"
arch=('i686' 'x86_64')
license=('GPL')
source=("thinkfan-0.7.1.tar.gz" "thinkfand" "thinkfan.c.patch")
url="https://phuk.ath.cx:3443/wordpress/?p=93"
md5sums=('0e98ec7854edbb8186544f3aec6d95e4'
         '16fc3a83a1468e3ccaeba67e14ab2177'
         'd11cbf5038f665f19d300d962e1345eb')
backup=('etc/thinkfan.conf')

build() {
    cd $srcdir/thinkfan-0.7.1
    # apply t410 patch
    patch -p0 thinkfan.c < ../../thinkfan.c.patch
    make
    install -d $startdir/pkg/usr/sbin
    install $srcdir/thinkfan-0.7.1/thinkfan $startdir/pkg/usr/sbin
    install -D -m755 ${startdir}/thinkfand ${pkgdir}/etc/rc.d/thinkfan

    if ! [[ -f /proc/acpi/ibm/fan ]]; then 
        echo "thinkpad_acpi procfs entries don't seem to exist." \
        "You'll need to use the generic sysfs hwmon interface. Will use sysfs conf."
        install -D -m644 thinkfan.conf.sysfs ${pkgdir}/etc/thinkfan.conf
    else
        echo "This seems to be a Thinkpad. You should use the IBM" \
        "interface. Will use thinkfan conf."
        install -D -m644 thinkfan.conf.thinkpad ${pkgdir}/etc/thinkfan.conf
    fi
}
