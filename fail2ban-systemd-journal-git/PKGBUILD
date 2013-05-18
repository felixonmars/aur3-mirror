# Maintainer: bluephoenix47 <bluephoenix47@gmail.com>
# Contributor: Pedro Sland
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: michalzxc
# Contributor: nbags <neilbags@gmail.com>

pkgname=fail2ban-systemd-journal-git
pkgver=20130518
pkgrel=1
pkgdesc='Bans IPs after too many failed authentification attempts against common daemons'
url='http://www.fail2ban.org/'
license=('GPL')
arch=('any')
makedepends=('git')
depends=('systemd>=204' 'iptables')
conflicts=('fail2ban')
backup=(etc/fail2ban/fail2ban.conf
        etc/fail2ban/jail.conf)
source=(service tmpfiles.conf fail2ban.conf.patch)
md5sums=('4eba448beb0cf1ca4fbbe8b174f3c165'
         '06b9736a7f2efef3fb7edb8d6c31f940'
         '7404a28074fd472dbbed8bbd9a148bdf')

_gitroot="git://github.com/kwirk/fail2ban.git"
_gitname="fail2ban"

build() {
  cd "$srcdir"
  msg "Connecting to the Git repository..."

  if [[ -d "$srcdir/$_gitname" ]] ; then
    cd "$_gitname"
    git pull origin
    msg "The local files are updated"
  else
    git clone --depth 1 "$_gitroot" -b systemd-journal --single-branch "$srcdir/$_gitname"
  fi
}

package(){
  cd "$srcdir/$_gitname"

  patch -p1 < "$srcdir/fail2ban.conf.patch"
  bash fail2ban-2to3
  python setup.py install --root $pkgdir

  install -Dm644 $srcdir/service $pkgdir/usr/lib/systemd/system/fail2ban.service
  install -Dm644 $srcdir/tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/fail2ban.conf

  # avoid conflict with filesystem>=2012.06
  mv $pkgdir/var/run $pkgdir/run
}
