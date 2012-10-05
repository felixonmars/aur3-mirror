# Maintainer: CrookedNixon <cn at crookednixon point com>
pkgname=magmakeys-git
pkgver=20121005
pkgrel=1
pkgdesc="A system wide hotkey daemon."
url="https://github.com/wertarbyte/magmakeys"
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl')
makedepends=('git')
optdepends=('hal' 'perl-net-dbus: for identifying existing and newly connected devices')
source=(magmakeys.daemon
	daemon.conf)
md5sums=('e707b01f641d7bc3fb3509abbec1b79e'
         'a4a6404f020e0a91af9700e27fa8309e')

_gitroot="git://github.com/wertarbyte/magmakeys.git"
_gitname="magmakeys"

build() {

  # put the custom daemon script in /etc/rc.d
  mkdir -p "${pkgdir}/etc/rc.d/"
  install -m 755 magmakeys.daemon "${pkgdir}/etc/rc.d/magmakeys"

  # put the custom daemon config file in /etc/magmakeys
  mkdir -p "${pkgdir}/etc/magmakeys/"
  install -m 644 daemon.conf "${pkgdir}/etc/magmakeys"

  cd "${srcdir}/"

  msg "Connecting to the GIT server...."

  if [[ -d "${srcdir}/$_gitname" ]] ; then
    cd "$_gitname"
    git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi
  
  cd "${srcdir}/${_gitname}/"
  
  # Put lib contents in /usr/share/perl5/vendor_perl/magmakeys
  mkdir -p "${pkgdir}/usr/share/perl5/vendor_perl/magmakeys"
  install -m 644 lib/magmakeys/* "${pkgdir}/usr/share/perl5/vendor_perl/magmakeys" || return 1
  
  # put share/eventcodes.txt in /usr/share/magmakeys"  
  mkdir -p "${pkgdir}/usr/share/magmakeys/"
  install -m 644 share/eventcodes.txt "${pkgdir}/usr/share/magmakeys/" || return 1
  
  # put examples/keys.d/example in /etc/magmakeys/keys.d
  mkdir -p "${pkgdir}/etc/magmakeys/keys.d"
  install -m 644 examples/keys.d/example "${pkgdir}/etc/magmakeys/keys.d/" || return 1
  
  # put examples/script/toggle-sysfs in /etc/magmakeys/script
  mkdir -p "${pkgdir}/etc/magmakeys/script"
  install -m 755 examples/script/toggle-sysfs "${pkgdir}/etc/magmakeys/script" || return 1
  
  # put bin/magmakeys in /usr/bin
  mkdir -p "${pkgdir}/usr/bin/"
  install -m 755 bin/magmakeys "${pkgdir}/usr/bin/" || return 1  
  
}
