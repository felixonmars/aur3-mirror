# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=aif-git
pkgver=20100404
pkgrel=1
pkgdesc="The ArchLinux Installation Framework: latest from the git master branch"
arch=('any')
url="http://projects.archlinux.org/?p=aif.git;a=summary"
license=('GPL3')
depends=('bash' 'pacman' 'coreutils' 'grub' 'grep' 'mkinitcpio' 'awk' 'sed' 'libui-sh')
optdepends=('markdown: to generate the html installation guide'
            'cryptsetup: for encryption support'
            'lvm2: for LVM support'
            'dhcpd: for dhcp networking support'
            'e2fsprogs: Ext support'
            'jfsutils: JFS support'
            'reiserfsprogs: ReiserFS support'
            'xfsprogs: XFS support'
            'ntp: setting date with NTP'
            'dialog: for ncurses support'
            )
makedepends=('git')
provides=('aif')
conflicts=('aif')
source=()
md5sums=()

_gitroot="git://github.com/Dieterbe/aif.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
