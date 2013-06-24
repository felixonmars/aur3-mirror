# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>
pkgname=rmonitor
pkgver=0.0.8
pkgrel=1
pkgdesc="A tool for creating monitor profiles that are easily invoked."
arch=('any')
url="https://github.com/badeball/rmonitor"
license=('MIT')
groups=()
depends=('ruby' 'xorg-xrandr')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git://github.com/badeball/${pkgname}.git#tag=v${pkgver}")
noextract=()
md5sums=('SKIP')

package() {
    cd ${pkgname}

    # Install the license
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install the package
    install -D -m755 bin/rmonitor.rb "${pkgdir}/usr/lib/${pkgname}/bin/rmonitor.rb"
    install -D -m755 bin/append.rb   "${pkgdir}/usr/lib/${pkgname}/bin/append.rb"
    install -D -m755 bin/create.rb   "${pkgdir}/usr/lib/${pkgname}/bin/create.rb"
    install -D -m755 bin/invoke.rb   "${pkgdir}/usr/lib/${pkgname}/bin/invoke.rb"
    install -D -m755 bin/update.rb   "${pkgdir}/usr/lib/${pkgname}/bin/update.rb"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/usr/lib/${pkgname}/bin/rmonitor.rb" "${pkgdir}/usr/bin/${pkgname}"

    install -D -m644 lib/helpers/dsl_helpers.rb          "${pkgdir}/usr/lib/${pkgname}/lib/helpers/dsl_helpers.rb"
    install -D -m644 lib/helpers/profile_helpers.rb      "${pkgdir}/usr/lib/${pkgname}/lib/helpers/profile_helpers.rb"
    install -D -m644 lib/helpers/xrandr_read_helpers.rb  "${pkgdir}/usr/lib/${pkgname}/lib/helpers/xrandr_read_helpers.rb"
    install -D -m644 lib/helpers/xrandr_write_helpers.rb "${pkgdir}/usr/lib/${pkgname}/lib/helpers/xrandr_write_helpers.rb"

    install -D -m644 lib/devices.rb  "${pkgdir}/usr/lib/${pkgname}/lib/devices.rb"
    install -D -m644 lib/profiles.rb "${pkgdir}/usr/lib/${pkgname}/lib/profiles.rb"

    install -D -m644 rmonitor.rb     "${pkgdir}/usr/lib/${pkgname}/rmonitor.rb"
}
