# Author:   justviper <http://justviper.deviantart.com/>
# Maintainer: sanderd17 <sanderd17 at gmail dot com>

pkgname=gnome-shell-theme-elementary-viper-luna
pkgver=20111122
pkgrel=1
pkgdesc="A bright gnome shell theme by justviper" 
url="http://justviper.deviantart.com/art/ElementaryViper-Luna-shell-261144492"
license=('unknown')
arch=('any')
depends=('gnome-shell>=3.2')
makedepends=('unzip')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/261144492/elementaryviper_luna_shell_by_justviper-d4bh8do.zip")
md5sums=('ee7c39e33730e348f24dc8fd80528f07')

build() {
  mkdir -p ${pkgdir}/usr/share/themes/
  mv ${srcdir}/ElementaryViper\ Luna ${pkgdir}/usr/share/themes/
  
}


