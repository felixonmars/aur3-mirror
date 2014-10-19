# Maintainer: shimi <shimi.chen@gmail.com>

pkgname=android_mpris_bridge-git
pkgver=r72.3733ccd
pkgrel=1
pkgdesc="Android MPRIS Bridge allows you to control your Linux audio apps from Android and more; works with most Linux audio apps (supporting the MPRIS DBUS standard)."
arch=(any)
url="https://bitbucket.org/mderezynski/android_mpris_bridge/overview"
license=('GPL3')
depends=('python2-jsonrpclib' 'python2-dbus' 'avahi' 'pulseaudio')
makedepends=('git')
provides=('android_mpris_bridge')
conflicts=('android_mpris_bridge')
_gitname=android_mpris_bridge

source=("android_mpris_bridge::git+https://bitbucket.org/mderezynski/android_mpris_bridge.git")
pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  cd "$srcdir/$_gitname/mprisap"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  find $pkgdir -type f -print|xargs file|grep ASCII|cut -d: -f1|xargs sed -i 's|/usr/bin/python|/usr/bin/python2|g'
}
md5sums=('SKIP')