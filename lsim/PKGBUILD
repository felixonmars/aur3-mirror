# Maintainer: TDY <tdy@archlinux.info>

pkgname=lsim
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to superpose macromolecular electron densities and compute a structural similarity score"
arch=('i686' 'x86_64')
url="http://www.molspaces.com/lsim/"
license=('custom')
depends=('glibc')
[[ $CARCH == x86_64 ]] && depends=('lib32-glibc')
install=lsim.install
source=(http://www.molspaces.com/dl/progs/lsim-linux.tar.gz
        lsim.sh)
md5sums=('d29a2cc2c7caf1582a7f3e55d349bbe5'
         '522520a48dc9588ed3c78cc2f914a796')

package() {
  cd "$srcdir/lsim.$pkgver"
  install -Dm755 lsim "$pkgdir/usr/bin/lsim"
  install -Dm644 lsim.par "$pkgdir/usr/share/lsim/lsim.par"
  install -cm644 atdens.dat "$pkgdir/usr/share/lsim/atdens.dat"
  install -Dm644 test/job.cmd "$pkgdir/usr/share/lsim/examples/job.cmd"
  install -cm644 test/*.pdb "$pkgdir/usr/share/lsim/examples/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/lsim/LICENSE"
  install -Dm755 ../lsim.sh "$pkgdir/etc/profile.d/lsim.sh"
}

# vim:set ts=2 sw=2 et:
