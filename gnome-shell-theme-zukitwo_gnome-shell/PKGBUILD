# Maintainer: hobbypunk <hoppe.marcel at gmail dot com>

pkgname=gnome-shell-theme-zukitwo_gnome-shell
pkgver=0.1
pkgrel=1
pkgdesc="A mixed Gnome-Shell theme from Zukitwo-Shell and the Standard Theme" 
url="https://bitbucket.org/hobbypunk/gnome-themes/overview"
license=('GPL')
arch=('any')
depends=('gnome-shell>=3.10')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("https://bitbucket.org/hobbypunk/gnome-themes/downloads/Zukitwo-Gnome-Shell_0.1.tar.gz")
md5sums=('fc67ad3fdcbdf22b4bad7a345728e538')

build() {
  mkdir -p "${pkgdir}/usr/share/themes/"
  mv "${srcdir}/Zukitwo-Gnome-Shell" "${pkgdir}/usr/share/themes/"
}


