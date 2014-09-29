# Maintainer: oggy <ognjen.maric@gmail.com>

pkgname=thinkpad-yoga-rotate
pkgver=0.3
pkgrel=1
pkgdesc="A small Thinkpad Yoga utility to automatically rotate the screen in tablet mode"
url="https://github.com/oggy-/thinkpad-yoga-rotate"
license=('GPL-3')
arch=('any')
depends=('xorg-xrandr' 'acpid')
source=('rotate-screen.sh' 'tablet-mode')
sha1sums=(
    'f768fe381463c1bfc9c33d36c62a6d6d1e7bc7fb'
    'adf3aa47174d32f23f4f52186bdc8de07a802ddc')
install=$pkgname.install

package() {
    # "Register" the tablet-mode event and set the handler
    mkdir -p "$pkgdir/etc/acpi/events"
    install -m 644 tablet-mode "$pkgdir/etc/acpi/events"

    # Install the handler
    mkdir -p "$pkgdir/etc/acpi/actions"
    install -m 755 rotate-screen.sh "$pkgdir/etc/acpi/actions"
}



