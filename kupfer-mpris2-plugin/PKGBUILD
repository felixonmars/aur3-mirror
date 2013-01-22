# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=kupfer-mpris2-plugin
pkgver=20130119
pkgrel=1
pkgdesc="Control mpris compatable media players from Kupfer"
arch=(any)
url=https://github.com/hugosenari/Kupfer-Plugins
license=('GPL')
depends=(mpris2-git kupfer)
makedepends=(git)

_gitroot=git://github.com/hugosenari/Kupfer-Plugins.git
_gitname=Kupfer-Plugins

package() {
    cd "$srcdir"
    msg "Connecting to the GIT server..."
    if [[ -d $_gitname/.git ]]; then
        pushd $_gitname && git pull
        msg2 "The local files are updated."
        popd
    else
        git clone --depth 1 $_gitroot
    fi
    msg2 "GIT checkout done or server timeout"

    rm -rf $_gitname-build/
    cp -r $_gitname/ $_gitname-build/
    cd $_gitname-build/

    msg "Installing..."
    install -d "$pkgdir"/usr/share/kupfer/kupfer/
    cp -r mpris2-player/ "$pkgdir"/usr/share/kupfer/kupfer/plugin/
}
