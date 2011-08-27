# Contributor: Nicolas Bigaouette nbigaouette a_t gmail c o m

pkgname=acpi-eeepc-generic
pkgver=1.0rc3
pkgrel=0.1
pkgdesc="ACPI scripts for EeePC netbook computers (700, 701, 900, 900A, 901, 904HD, S101, 1000, 1000H, 1000HD, 1000HE, 1005HA, 1005-HA-H, 1005PE, 1005P, 1008HA, 1201N, T91MT)"
url="http://code.google.com/p/acpi-eeepc-generic/"
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
    "acpi-eeepc-1000-events.conf"
    "acpi-eeepc-1000H-events.conf"
    "acpi-eeepc-1000HD-events.conf"
    "acpi-eeepc-1000HE-events.conf"
    "acpi-eeepc-1005HA-events.conf"
    "acpi-eeepc-1005-HA-H-events.conf"
    "acpi-eeepc-1005PE-events.conf"
    "acpi-eeepc-1005P-events.conf"
    "acpi-eeepc-1008HA-events.conf"
    "acpi-eeepc-1001P-events.conf"
    "acpi-eeepc-1201N-events.conf"
    "acpi-eeepc-700-events.conf"
    "acpi-eeepc-701-events.conf"
    "acpi-eeepc-900-events.conf"
    "acpi-eeepc-900A-events.conf"
    "acpi-eeepc-901-events.conf"
    "acpi-eeepc-904HD-events.conf"
    "acpi-eeepc-S101-events.conf"
    "acpi-eeepc-T91MT-events.conf"
    "acpi-eeepc-defaults-events.conf"
    "acpi-eeepc-generic-events"
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
    "acpi-eeepc-generic.conf"
    "bluetooth.png"
    "eee.png")

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

    install -m0644 ${srcdir}/eee.png ${pkgdir}/usr/share/pixmaps || return 1
    install -m0644 ${srcdir}/bluetooth.png ${pkgdir}/usr/share/pixmaps || return 1
}

md5sums=('be2c9c078c781185356c775f7a785569'
         'be2c9c078c781185356c775f7a785569'
         'be2c9c078c781185356c775f7a785569'
         '8978b064b40be086942116b0c7779de6'
         '5ec8097c18e623d6ba2bff1f5a814885'
         'be56ea98b9aa016098bdab9cbb110334'
         '03c04440f12e3700592664320b9138a6'
         '03c04440f12e3700592664320b9138a6'
         '5ec8097c18e623d6ba2bff1f5a814885'
         '5ec8097c18e623d6ba2bff1f5a814885'
         'c75b95926e0ac397b0eea6e054ea9154'
         '75016dde1f414772434c2c151b159c29'
         '75016dde1f414772434c2c151b159c29'
         'ae981fe86cd99b736ba740fffbfec3e0'
         'a34fbf623a7d3e41cdf378924837dbbe'
         '0e7c2e4cdcb2894d67cb62f526ae491d'
         '533018701f2f67873396994ec364bb36'
         'ce02758525ba114f2f0ab3d5c564d4f3'
         '75bd2c42f01a6733ab5a2f7a0c15c70d'
         '323c03e32baec7eca3f360a282490cda'
         'cf253e386d7e743a3d25ec4165051521'
         '9444ff2c95380825af9f8c0c3ea65566'
         '0964588390647e98b475af0fb3f688de'
         '06137998d8ef768763bb327f8716641e'
         '7e26565bd36e2411ab998d6bcfe15f9e'
         '13c38e64dab996301f8d724342178cfc'
         '026238ef581ca0e844d3304c5df9433f'
         '3927305c811cef63ae52e803a169d7b2'
         'e956bc5d3761630f3c01b8b7df80f1d1'
         '45738315630165b45470694a67c8121d'
         '87a977662d92c640b21b97e1c705ad57'
         '12c506d5a4ae304833f22f04b5d5c1f0'
         '614647590c18eb4de123263bd7bceaa8'
         'ca53efde37b4484ca05a5a9dddde423c'
         'fb7539a926831b28050267e13394c831'
         '39f88b5f21b1249a1da04e921deeec95'
         '78c1e053f5c310a697d4e52988b2d342'
         'b6e3ad05a0d6c9ed87bd0859267e86d8'
         '4d9af939dbd59121cd4bb191d340eb1c')
