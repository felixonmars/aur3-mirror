# Maintainer: vicky91 <vickypaiers@gmail.com>

pkgname=kdeplasma-applets-facebook-notifier-git
pkgver=20120716
pkgrel=1
pkgdesc="A KDE plasmoid that shows your facebook notifications fetched from the notifications feed URL provided to the plasmoid."
arch=('i686' 'x86_64')
url="https://github.com/viranch/facebook-notifier-kde-plasmoid"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'git')
conflicts=('facebook-notifier-kde-plasmoid-git')
replaces=('facebook-notifier-kde-plasmoid-git')

_gitroot="https://github.com/viranch/facebook-notifier-kde-plasmoid.git"
_gitname=facebook-notifier-kde-plasmoid

build() {
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."
}

package() {
  cd "$_gitname"
  install -d "${pkgdir}"/usr/share/apps/plasma/plasmoids/facebook-notifier/contents/{config,ui}
  install -m644 metadata.desktop \
    "${pkgdir}"/usr/share/apps/plasma/plasmoids/facebook-notifier/
  install -m644 contents/config/main.xml \
    "${pkgdir}"/usr/share/apps/plasma/plasmoids/facebook-notifier/contents/config/
  install -m644 contents/ui/{Notification.qml,config.ui,main.qml} \
    "${pkgdir}"/usr/share/apps/plasma/plasmoids/facebook-notifier/contents/ui/
  install -Dm644 metadata.desktop \
    "${pkgdir}"/usr/share/kde4/services/plasma-applet-facebook-notifier.desktop 
}