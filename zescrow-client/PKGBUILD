# Maintainer: Wesley Wiedenmeier <magicalchicken@mail.magicalchicken.dnsdynamic.net>

pkgname=zescrow-client
pkgver=172
pkgrel=1
pkgdesc="zEscrow provides an easy and secure way to back up ecryptfs mount passphrases and configuration. This pagkage provides a client for this service."
arch=('any')
url="http://launchpad.net/zescrow"
license=('AGPL')
depends=('bash' 'gnupg' 'ecryptfs-utils' 'coreutils' 'curl' 'tar')
optdepends=('pygtk: graphical interface')
makedepends=('bzr')

_bzrtrunk="https://code.launchpad.net/~zescrow/zescrow/trunk"
_bzrmod="zescrow"

build() {
    msg "Connecting to Bazzar server..."

    if [[ -d "$_bzrmod" ]]; then
        cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
        msg "The local files are updated."
    else
        bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
    fi

    msg "Bazzar checkout done or server timeout"
    msg "Starting install..."
}

package() {
    cd zescrow
    msg "Compressing man page..."
    cd usr/share/man/man1
    if [[ -e zEscrow.1.gz ]]; then
        msg "Compressed ma page already exists"
    else
        gzip -9 zEscrow.1
    fi
    install -Dm644 zEscrow.1.gz "$pkgdir"/usr/share/man/man1/zEscrow.1.gz
    cd ../../
    install -d zEscrow "$pkgdir"/usr/share/zEscrow/
    cd zEscrow
    install -Dm644 * "$pkgdir"/usr/share/zEscrow/
    cd ../
    install -d applications "$pkgdir"/usr/share/applications/
    cd applications
    install -Dm644 zEscrow.desktop "$pkgdir"/usr/share/applications/zEscrow.desktop
    cd ../../bin/
    install -d . "$pkgdir"/usr/bin/
    install -Dm755 * "$pkgdir"/usr/bin/
    cd ../
    install -d share/icons/hicolor/scalable/apps "$pkgdir"/usr/share/icons/hicolor/scalable/apps
    cd share/icons/hicolor/scalable/apps
    install -Dm644 zEscrow.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/zEscrow.svg
}
