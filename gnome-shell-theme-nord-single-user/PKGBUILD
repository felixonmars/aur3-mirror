# Author: ~0rAX0 <http://0rax0.deviantart.com/>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-nord-single-user
pkgver=1.1
pkgrel=1
pkgdesc="This is a GNOME Shell theme with a glassy transparent look. No system wide installation."
url="http://0rax0.deviantart.com/art/Nord-Gnome-shell-214295138"
license=('cc-by-nc-sa-3.0')
arch=('any')
depends=('gnome-shell' 'ttf-droid')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/214295138/gnome_shell__nord_by_0rax0-d3jl36q.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('2bde3bec2736a62fca7d9e6e37eb8035')

package() {
  mkdir -p "${pkgdir}$HOME/.themes/"
  mv "${srcdir}/Nord" "${pkgdir}$HOME/.themes/"
}

