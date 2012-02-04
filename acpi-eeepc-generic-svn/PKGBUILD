# Maintainer: Nicolas Bigaouette <nbigaouette@gmail.com>
# Greatly inspired by:
#   EeePC ACPI Utilities : http://eeepc-acpi-util.sourceforge.net
#   Other Eee acpi packages from AUR: http://aur.archlinux.org/packages.php?K=eee

# TODO
#   Fix Bluetooth
#   Some models ACPI events might be wrong or not there at all
#   Restore feature of http://eeepc-acpi-util.sourceforge.net/ has yet to be implemented.
#   FSB control
#   Touch /var/eeepc/power.lock on shutdown to prevent accidental suspend. Should be deleted at boot.
#   More automatic detection of LineIn/LineOut/iSpeaker...
#   Autodetection of wifi module and include different hacks for each of them. See acpi-eee 10.0-1's wlan.sh
#   Set resolution with xrandr (see display.sh) necessary?
#   Reset values of AC after resume (see powersource.sh, called at the end of suspend2ram.sh)
#   Fan control??

pkgname=acpi-eeepc-generic-svn
pkgver=0.3.2
pkgrel=2
pkgdesc="ACPI scripts for EeePC netbook computers (700, 701, 900, 900A, 901, 904HD, S101, 1000, 1000H, 1000HD)"
url="http://code.google.com/p/acpi-eeepc-generic/"
arch=(i686)
license=(GPL2)
depends=(acpid libnotify xorg-server-utils dmidecode)
install=$pkgname.install
backup=(etc/conf.d/acpi-eeepc-generic.conf)
conflicts=("acpi-eee" "acpi-eee900" "acpi-eee901" "acpi-eee1000" "acpi-eeepc900" "buttons-eee901" "e3acpi" "eee-control" "eee-fan")
source=(
    "acpi-eeepc-generic-handler.sh"
    "acpi-eeepc-generic-functions.sh"
    "acpi-eeepc-generic-events"
    "acpi-eeepc-generic-restore.rcd"
    "acpi-eeepc-generic-logsbackup.rcd"
    "acpi-eeepc-generic.conf"
    "acpi-eeepc-generic-wifi-toggle.sh"
    "acpi-eeepc-generic-bluetooth-toggle.sh"
    "acpi-eeepc-generic-suspend2ram.sh"
    "acpi-eeepc-generic-rotate-lvds.sh"
    "eeepc.desktop"
    "eee.png"
    "acpi-eeepc-1000-events.conf"
    "acpi-eeepc-1000H-events.conf"
    "acpi-eeepc-1000HD-events.conf"
    "acpi-eeepc-700-events.conf"
    "acpi-eeepc-701-events.conf"
    "acpi-eeepc-900-events.conf"
    "acpi-eeepc-900A-events.conf"
    "acpi-eeepc-901-events.conf"
    "acpi-eeepc-904HD-events.conf"
    "acpi-eeepc-S101-events.conf")
md5sums=('64eea385e307556e6149efe644c29604'
         '44e5ddee64dad7f0a1a1946608ecface'
         'cf253e386d7e743a3d25ec4165051521'
         'a17f9fa32514dcd3d3596a237e517cc5'
         'a1995a198c8e71b1afb0d86a8a8bc5e1'
         '585c1f542aee73fa9331433dfb8b3352'
         'b2217737f73eacd8269461ee336648fb'
         '0eeb1f39a431a0eb8d0553d4cd555c2e'
         '6fa6ac6794bef0e077b3aaa83266365d'
         'f499c7af27f091cc85237b3fb9aa4a87'
         '6e46b54564cdd14f2588c921c0a7faf1'
         '4d9af939dbd59121cd4bb191d340eb1c'
         '6950474780bed9dcc216e2e965227b2e'
         '6950474780bed9dcc216e2e965227b2e'
         '6950474780bed9dcc216e2e965227b2e'
         '024286372c0a0e005804711b022dc4a3'
         '024286372c0a0e005804711b022dc4a3'
         '36ac41aec1b63e66fcb8ecab72a7af0e'
         '36ac41aec1b63e66fcb8ecab72a7af0e'
         '36ac41aec1b63e66fcb8ecab72a7af0e'
         '36ac41aec1b63e66fcb8ecab72a7af0e'
         '6950474780bed9dcc216e2e965227b2e')

build() {
    #cd $srcdir/$pkgname-$pkgver

    mkdir -p $pkgdir/{etc/{acpi/{eeepc/models,events},conf.d,rc.d},usr/share/{applications,pixmaps}}

    # Install our own handler
    install -m0755 ${srcdir}/acpi-eeepc-generic-handler.sh ${pkgdir}/etc/acpi/acpi-eeepc-generic-handler.sh || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-functions.sh ${pkgdir}/etc/acpi/eeepc/acpi-eeepc-generic-functions.sh || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-events ${pkgdir}/etc/acpi/events/acpi-eeepc-generic-events || return 1

    install -m0644 ${srcdir}/acpi-eeepc-generic.conf ${pkgdir}/etc/conf.d/acpi-eeepc-generic.conf || return 1

    # Install events configuration files for each model
    for f in ${srcdir}/acpi-eeepc-*-events.conf; do
        install -m0644 $f ${pkgdir}/etc/acpi/eeepc/models
    done

    #install -m0755 ${srcdir}/acpi-eeepc-generic-restore.rcd ${pkgdir}/etc/rc.d/eeepc-restore || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-logsbackup.rcd ${pkgdir}/etc/rc.d/logsbackup || return 1

    # Helper scripts
	install -m0755 ${srcdir}/acpi-eeepc-generic-suspend2ram.sh ${pkgdir}/etc/acpi/eeepc || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-wifi-toggle.sh ${pkgdir}/etc/acpi/eeepc || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-bluetooth-toggle.sh ${pkgdir}/etc/acpi/eeepc || return 1
    install -m0755 ${srcdir}/acpi-eeepc-generic-rotate-lvds.sh ${pkgdir}/etc/acpi/eeepc || return 1

    install -m0755 ${srcdir}/eeepc.desktop ${pkgdir}/usr/share/applications/eeepc.desktop || return 1
    install -m0644 ${srcdir}/eee.png ${pkgdir}/usr/share/pixmaps/eee.png || return 1

}

