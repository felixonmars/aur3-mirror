# Maintainer: Sebastien Luttringer <seblu+arch@seblu.net>

pkgname=linux-kvm
pkgver=20110812
pkgrel=1
pkgdesc='Native Linux KVM tool (should be upstream soon).'
arch=('i686' 'x86_64')
license=('GPL2')
url='https://github.com/penberg/linux-kvm'
#depends=()
conflict=('qemu-kvm')
provides=('kvm')
#options=()
#source=()
#md5sums=()

gitroot='git://github.com/penberg/linux-kvm.git'
gitname='linux-kvm'

build() {
  # manually fetch git repository
  cd "$startdir"
  if (( NOEXTRACT == 0 )); then
    if [[ -d $gitname ]] ; then
	    msg2 'Pulling git'
	    cd $gitname
      git pull origin
    else
      msg2 'Cloning git'
	    git clone --depth 1 "$gitroot"
    fi
  fi
  # linking source to srdir
  ln -sf "$startdir/$gitname" "$srcdir"
  # start building
  msg2 'Compiling'
  cd "$srcdir/$gitname/tools/kvm"
  make
}

#check() {
#  cd "$srcdir/$gitname/tools/kvm"
#  make check
#}

package() {
  cd "$srcdir/$gitname/tools/kvm"
  install -D -m 755 "$srcdir/$gitname/tools/kvm/kvm" "$pkgdir/usr/bin/kvm"
}

# vim:set ts=2 sw=2 ft=sh et:
