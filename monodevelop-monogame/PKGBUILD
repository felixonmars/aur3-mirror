# Maintainer: Philippe Hürlimann <phihue@gmail.com>
pkgname=monodevelop-monogame
pkgver=2.5.1.0
pkgrel=1
pkgdesc="Monodevelop project templates for the XNA Implementation for Mono based platforms"
arch=('any')
license=("Microsoft Public License")
depends=('monodevelop' 'monogame') # ignore the namcap warning that these two aren't needed
makedepends=('nant')
options=(!strip)
url="http://monogame.codeplex.com"
source=("$pkgver.tar.gz::https://github.com/mono/MonoGame/tarball/$pkgver")
md5sums=('28fa5f161d9e44e54cef2040927eccfb')

build() {
    cd "$srcdir/mono-MonoGame-56afa04/ProjectTemplates/MonoDevelop.MonoGame.2.5/MonoDevelop.MonoGame"
    nant
}

package() {
    install -Dm644 \
        "$srcdir/mono-MonoGame-56afa04/ProjectTemplates/MonoDevelop.MonoGame.2.5/MonoDevelop.MonoGame/MonoDevelop.MonoGame/bin/Release/MonoDevelop.MonoGame.dll" \
        "$pkgdir/usr/lib/monodevelop/AddIns/MonoDevelop.MonoGame/MonoDevelop.MonoGame.dll"

    cp -vr "$srcdir/mono-MonoGame-56afa04/ProjectTemplates/MonoDevelop.MonoGame.2.5/icons" \
        "$pkgdir/usr/lib/monodevelop/AddIns/MonoDevelop.MonoGame"

    cp -r  "$srcdir/mono-MonoGame-56afa04/ProjectTemplates/MonoDevelop.MonoGame.2.5/templates" \
        "$pkgdir/usr/lib/monodevelop/AddIns/MonoDevelop.MonoGame"

    install -Dm644 "$srcdir/mono-MonoGame-"*"/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


