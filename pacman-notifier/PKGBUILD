# Contributor: v01d <phreakuencies@gmail.com>
pkgname=pacman-notifier
pkgver=0.6.5.1
pkgrel=1
pkgdesc="A System Tray new-package notifier for ArchLinux"
arch=(i686 x86_64)
url="http://wiki.github.com/v01d/pacman-notifier"
license=('GPL2')
depends=(ruby ruby-gtk2 librsvg 'ruby-libnotify>=0.5' 'pacman>=3.3' sudo)
makedepends=(ruby)
source=(pacman-notifier-${pkgver}.tgz::http://github.com/v01d/pacman-notifier/tarball/${pkgver})
optdepends=('kdebase-konsole: default configuration uses konsole to run upgrade command')
optdepends=('gnome-terminal: you can also use the GNOME terminal for the upgrade command')

build() {
  cd ${srcdir}/v01d-pacman-notifier-*
  ruby setup.rb config --prefix=/usr
  ruby setup.rb setup 
  ruby setup.rb install --prefix=${pkgdir} 
}

# vim:set ts=2 sw=2 et:

md5sums=('e09fe9c64d424eee745b4f03d4774568')
