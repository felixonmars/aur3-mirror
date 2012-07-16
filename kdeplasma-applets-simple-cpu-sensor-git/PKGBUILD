# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeplasma-applets-simple-cpu-sensor-git
pkgver=20120716
pkgrel=1
pkgdesc="A simple CPU monitoring plasmoid for KDE"
arch=('any')
url="http://kde-look.org/content/show.php?content=135310"
license=('GPL')
depends=('kdebase-workspace' 'kdebindings-python2')

_gitroot="https://github.com/alex-oleshkevich/simple-cpu-sensor.git"
_gitname="simple-cpu-sensor"

build() {
  msg "Connecting to GIT server...."

  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
}

package() {  
  cd "$_gitname"

  install -d "${pkgdir}"/usr/share/apps/plasma/plasmoids/simple-cpu-sensor/contents/{code,ui}
  install -m644 metadata.desktop \
    "${pkgdir}"/usr/share/apps/plasma/plasmoids/simple-cpu-sensor/
  install -m644 contents/code/{config,configwindow,main,util}.py \
    "${pkgdir}"/usr/share/apps/plasma/plasmoids/simple-cpu-sensor/contents/code/
  install -m644 contents/ui/configwindow.ui \
    "${pkgdir}"/usr/share/apps/plasma/plasmoids/simple-cpu-sensor/contents/ui/
  install -Dm644 metadata.desktop \
    "${pkgdir}"/usr/share/kde4/services/plasma-applet-simple-cpu-sensor.desktop 
}
