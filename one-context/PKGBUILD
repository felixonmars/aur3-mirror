# Maintainer: ungleich GmbH <archlinux@ungleich.ch>

pkgname=one-context
pkgver=4.8.1
pkgrel=9
pkgdesc='Opennebula Contextualisation'
arch=('any')
url='http://dev.opennebula.org/projects/opennebula/files'
license=('Apache')
depends=()
source=("http://dev.opennebula.org/attachments/download/815/one-context_${pkgver}.rpm"
    "one-context.patch")
install=one-context.install

prepare() {
    patch -p1 < one-context.patch
    mv etc/udev/rules.d/75-persistent-net-generator.rules etc/udev/rules.d/75-net-description.rules 
    rm -f etc/udev/rules.d/75-cd-aliases-generator.rules
}

build() {
    mkdir -p usr/lib/systemd/system/

    cat << eof > usr/lib/systemd/system/one-context.service
[Unit]
Description=$pkgdesk
Requires=network.target
After=network.target

[Service]
Type=oneshot

ExecStart=/etc/init.d/vmcontext start

StandardOutput=syslog
StandardError=syslog
SyslogIdentifier=one-context

RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
eof
}


package() {
    mv ${srcdir}/etc ${pkgdir}
    mv ${srcdir}/usr ${pkgdir}
}
md5sums=('87fc768ee92eaaa5c78eee7b9646482d'
         'd5bdd67b4c4607ca35e4391a1d9ca13f')
