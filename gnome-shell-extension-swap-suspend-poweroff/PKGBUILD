# Contributor: grimi <grimi at poczta dot fm>

pkgname=gnome-shell-extension-swap-suspend-poweroff
_fnname=swapsuspendpoweroff
pkgver=2.0
pkgrel=2
pkgdesc="A gnome-shell extension to swap Suspend with Power Off in user menu"
arch=('any')
url="http://www.fpmurphy.com/gnome-shell-extensions/"
license=('GPL2')
depends=('gnome-shell>=3.2') 
source=("http://www.fpmurphy.com/gnome-shell-extensions/${_fnname}-${pkgver}.tar.gz")
md5sums=('e3abca4ab5cdbc552a644979cf47be89')

package() {
    sed -i 's|\("3.2"\)|\1,"3.4"|' ${_fnname}@fpmurphy.com/metadata.json
    find ${_fnname}@fpmurphy.com/ -type f \
       -exec install -Dm644 "{}" "${pkgdir}/usr/share/gnome-shell/extensions/{}" \;
}

