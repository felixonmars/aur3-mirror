# Maintainer: Greg Sutcliffe <greg.sutcliffe@gmail.com>>

pkgname=foreman-proxy-git
pkgver=20121203
pkgrel=3
pkgdesc="Manages DNS, DHCP, TFTP and Puppet though a HTTP Restful API. Used by foreman"
arch=('any')
url="http://theforeman.org"
license=('GPL3')
depends=('ruby-sinatra' 'iputils' 'ruby')
makedepends=('git')
optdepends=('puppet' 'nmap')
provides=('foreman-proxy')
conflicts=('foreman-proxy')
backup=("etc/foreman-proxy/settings.yml")
options=(emptydirs)
install="foreman-proxy.install"
source=('foreman-proxy.systemd'
        'foreman-proxy.tmpfiles.conf')
noextract=()
md5sums=('c99762a8f6a0594965f54dcab5cf726a'
         'f6d26c35bf3b9a7c71105e72053785a1')

_gitroot=https://github.com/theforeman/smart-proxy.git
_gitname=foreman-proxy
_gitbranch=develop

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin && git reset "$_gitbranch" --hard
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"

}

package() {
  cd "$srcdir/$_gitname"

  # Main codebase
  install -d -m0755 $pkgdir/usr/share/foreman-proxy/
  cp -r ./ $pkgdir/usr/share/foreman-proxy/

  # Symlink config file to etc
  install -Dp -m0644 config/settings.yml.example $pkgdir/etc/foreman-proxy/settings.yml
  ln -sv /etc/foreman-proxy/settings.yml $pkgdir/usr/share/foreman-proxy/config/settings.yml

  # logdirs
  install -d -m0755 $pkgdir/usr/share/foreman-proxy/logs
  install -d -m0755 $pkgdir/var/log/foreman-proxy

  # systemd
  install -Dm 644 $srcdir/foreman-proxy.systemd       $pkgdir/usr/lib/systemd/system/foreman-proxy.service
  install -Dm 644 $srcdir/foreman-proxy.tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/foreman-proxy.conf

}

# vim:set ts=2 sw=2 et:
