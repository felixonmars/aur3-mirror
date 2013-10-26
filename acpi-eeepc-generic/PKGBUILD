# Contributor: Nicolas Bigaouette nbigaouette a_t gmail c o m

pkgname=acpi-eeepc-generic
pkgver=1.0.2
pkgrel=1
pkgdesc="ACPI scripts for many EeePC netbook computers"
url="https://github.com/nbigaouette/acpi-eeepc-generic"
arch=(any)
license=(GPL3)
depends=(acpid xorg-server-utils dmidecode)
optdepends=(
    "unclutter: Hide cursor when touchpad is disabled"
    "kdebase-runtime: KDE's super-user privileges gaining"
    "kdebase-kdialog: KDE's OSD"
    "sudo: super-user privileges gaining"
    "gksu: GNOME/GTK super-user privileges gaining"
)
install=$pkgname.install
backup=(etc/conf.d/acpi-eeepc-generic.conf)
conflicts=("acpi-eee" "acpi-eee900" "acpi-eee901" "acpi-eee1000" "acpi-eeepc900" "buttons-eee901" "e3acpi" "eee-control" "eee-fan")
source=(
    "acpi-eeepc-generic-events"
    "acpi-eeepc-defaults-events.conf"
    "acpi-eeepc-1000-events.conf"
    "acpi-eeepc-1000HD-events.conf"
    "acpi-eeepc-1000HE-events.conf"
    "acpi-eeepc-1000H-events.conf"
    "acpi-eeepc-1001P-events.conf"
    "acpi-eeepc-1001PX-events.conf"
    "acpi-eeepc-1005HA-events.conf"
    "acpi-eeepc-1005-HA-H-events.conf"
    "acpi-eeepc-1005HAG-events.conf"
    "acpi-eeepc-1005PE-events.conf"
    "acpi-eeepc-1005PEB-events.conf"
    "acpi-eeepc-1005P-events.conf"
    "acpi-eeepc-1005PX-events.conf"
    "acpi-eeepc-1005PXD-events.conf"
    "acpi-eeepc-1008HA-events.conf"
    "acpi-eeepc-1015B-events.conf"
    "acpi-eeepc-1015P-events.conf"
    "acpi-eeepc-1015PEM-events.conf"
    "acpi-eeepc-1015T-events.conf"
    "acpi-eeepc-1201HA-events.conf"
    "acpi-eeepc-1201N-events.conf"
    "acpi-eeepc-1201PN-events.conf"
    "acpi-eeepc-1201NL-events.conf"
    "acpi-eeepc-1215N-events.conf"
    "acpi-eeepc-1215B-events.conf"
    "acpi-eeepc-700-events.conf"
    "acpi-eeepc-701-events.conf"
    "acpi-eeepc-900A-events.conf"
    "acpi-eeepc-900-events.conf"
    "acpi-eeepc-901-events.conf"
    "acpi-eeepc-904HD-events.conf"
    "acpi-eeepc-S101-events.conf"
    "acpi-eeepc-T101MT-events.conf"
    "acpi-eeepc-T91MT-events.conf"
    "acpi-eeepc-X101H-events.conf"
    "acpi-eeepc-generic-functions.sh"
    "acpi-eeepc-generic-handler.sh"
    "acpi-eeepc-generic-logsbackup.rcd"
    "acpi-eeepc-generic-restore.rcd"
    "acpi-eeepc-generic-rotate-lvds.sh"
    "acpi-eeepc-generic-suspend2ram.sh"
    "acpi-eeepc-generic-toggle-bluetooth.sh"
    "acpi-eeepc-generic-toggle-cardr.sh"
    "acpi-eeepc-generic-toggle-displays.sh"
    "acpi-eeepc-generic-toggle-lock-suspend.sh"
    "acpi-eeepc-generic-toggle-resolution.sh"
    "acpi-eeepc-generic-toggle-she.sh"
    "acpi-eeepc-generic-toggle-touchpad.sh"
    "acpi-eeepc-generic-toggle-webcam.sh"
    "acpi-eeepc-generic-toggle-wifi.sh"
    "acpi-eeepc-generic.conf")

build() {
    mkdir -p $pkgdir/{etc/{acpi/{eeepc/models,events},conf.d,rc.d},usr/share/{applications,pixmaps}} || return 1

    # Install our own handler
    install -m0755 ${srcdir}/acpi-eeepc-generic-handler.sh ${pkgdir}/etc/acpi/acpi-eeepc-generic-handler.sh || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-functions.sh ${pkgdir}/etc/acpi/eeepc/acpi-eeepc-generic-functions.sh || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-events ${pkgdir}/etc/acpi/events/acpi-eeepc-generic-events || return 1

    install -m0644 ${srcdir}/acpi-eeepc-generic.conf ${pkgdir}/etc/conf.d/acpi-eeepc-generic.conf || return 1

    # Install events configuration files for each model
    for f in ${srcdir}/acpi-eeepc-*-events.conf; do
        install -m0644 $f ${pkgdir}/etc/acpi/eeepc/models || return 1
    done

    install -m0755 ${srcdir}/acpi-eeepc-generic-restore.rcd ${pkgdir}/etc/rc.d/eeepc-restore || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-logsbackup.rcd ${pkgdir}/etc/rc.d/logsbackup || return 1

    # Helper scripts
    install -m0755 ${srcdir}/acpi-eeepc-generic-rotate-lvds.sh ${pkgdir}/etc/acpi/eeepc || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-suspend2ram.sh ${pkgdir}/etc/acpi/eeepc || return 1
    for f in ${srcdir}/acpi-eeepc-generic-toggle-*.sh; do
        install -m0755 $f ${pkgdir}/etc/acpi/eeepc || return 1
    done
}

md5sums=('cf253e386d7e743a3d25ec4165051521'
         '323c03e32baec7eca3f360a282490cda'
         'be2c9c078c781185356c775f7a785569'
         'be2c9c078c781185356c775f7a785569'
         '8978b064b40be086942116b0c7779de6'
         'be2c9c078c781185356c775f7a785569'
         '5ec8097c18e623d6ba2bff1f5a814885'
         '476668a307c1ac833049ead5303cbc37'
         '5ec8097c18e623d6ba2bff1f5a814885'
         'be56ea98b9aa016098bdab9cbb110334'
         '5ec8097c18e623d6ba2bff1f5a814885'
         '03c04440f12e3700592664320b9138a6'
         '03c04440f12e3700592664320b9138a6'
         '03c04440f12e3700592664320b9138a6'
         '03c04440f12e3700592664320b9138a6'
         '03c04440f12e3700592664320b9138a6'
         '5ec8097c18e623d6ba2bff1f5a814885'
         '03c04440f12e3700592664320b9138a6'
         '03c04440f12e3700592664320b9138a6'
         '03c04440f12e3700592664320b9138a6'
         '03c04440f12e3700592664320b9138a6'
         'c75b95926e0ac397b0eea6e054ea9154'
         'c75b95926e0ac397b0eea6e054ea9154'
         'c75b95926e0ac397b0eea6e054ea9154'
         'c75b95926e0ac397b0eea6e054ea9154'
         'c75b95926e0ac397b0eea6e054ea9154'
         'c75b95926e0ac397b0eea6e054ea9154'
         '75016dde1f414772434c2c151b159c29'
         '75016dde1f414772434c2c151b159c29'
         'a34fbf623a7d3e41cdf378924837dbbe'
         'ae981fe86cd99b736ba740fffbfec3e0'
         '0e7c2e4cdcb2894d67cb62f526ae491d'
         '533018701f2f67873396994ec364bb36'
         'ce02758525ba114f2f0ab3d5c564d4f3'
         '75bd2c42f01a6733ab5a2f7a0c15c70d'
         '75bd2c42f01a6733ab5a2f7a0c15c70d'
         'c75b95926e0ac397b0eea6e054ea9154'
         '096f637d1548b2f28a6ddf751f5ff2c2'
         '000e26f2fd8fb92f750296b755a16649'
         '06137998d8ef768763bb327f8716641e'
         '7e26565bd36e2411ab998d6bcfe15f9e'
         '13c38e64dab996301f8d724342178cfc'
         'b84ce693c3095e5059da0fa84b575990'
         'fc6902bccab69842ba5bfc6139fcf74c'
         '0be0da28548b7f54baab01c4a559de8e'
         '45738315630165b45470694a67c8121d'
         '87a977662d92c640b21b97e1c705ad57'
         '12c506d5a4ae304833f22f04b5d5c1f0'
         '92d41b7a65fa773fc2c6c59b92c9859f'
         '318d5cae4a833dfccd0f10ba9496352b'
         '63908e6167fc455c678c21a045aef037'
         '4621ffb00858a03d05a89a669a20e6f5'
         'a7accb76fd44f06817925556fc337ac1')
