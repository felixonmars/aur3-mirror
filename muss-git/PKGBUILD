# Maintainer: mentat <cp.archlinux@0x2501.org>
pkgname=muss-git
pkgver=20120616
pkgrel=1
pkgdesc="Fast and simple command line music player to search matches file names in mpd database."
arch=('any')
url="https://github.com/dbro/muss"
license=('unknown')
depends=('mpd' 'mpc' 'sed' 'grep')

_gitroot="git://github.com/dbro/muss.git"
_gitname="muss"

build() {

  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname ]]; then
    cd $srcdir/$pkgname && git pull origin
    msg "The local repository was updated."
  else
    git clone $_gitroot $srcdir/$pkgname
    cd $srcdir/$pkgname
    msg "The remote repository was cloned."
  fi
  msg "GIT checkout done or server timeout"

  cd $srcdir/$pkgname

  install -D -m755 muss "${pkgdir}/usr/bin/muss"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_gitname}/README.md"

}

# vim:set ts=2 sw=2 et:
