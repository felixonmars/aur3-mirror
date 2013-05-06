# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>
pkgname=rmonitor
pkgver=0.0.4
pkgrel=1
pkgdesc="A tool for creating monitor profiles that are easily invoked."
arch=('any')
url="https://github.com/badeball/rmonitor"
license=('MIT')
groups=()
depends=('ruby' 'xorg-xrandr')
makedepends=()
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
    install -D -m755 bin/rmonitor.rb "${pkgdir}/usr/bin/${pkgname}"
    install -D -m755 bin/append.rb   "${pkgdir}/usr/lib/${pkgname}/bin/append"
    install -D -m755 bin/create.rb   "${pkgdir}/usr/lib/${pkgname}/bin/create"
    install -D -m755 bin/invoke.rb   "${pkgdir}/usr/lib/${pkgname}/bin/invoke"
    install -D -m755 bin/update.rb   "${pkgdir}/usr/lib/${pkgname}/bin/update"
    install -D -m644 lib/dsl.rb      "${pkgdir}/usr/lib/${pkgname}/lib/dsl.rb"
    install -D -m644 lib/profile.rb  "${pkgdir}/usr/lib/${pkgname}/lib/profile.rb"
    install -D -m644 lib/xrandr.rb   "${pkgdir}/usr/lib/${pkgname}/lib/xrandr.rb"
    install -D -m644 rmonitor.rb     "${pkgdir}/usr/lib/${pkgname}/rmonitor.rb"
}
