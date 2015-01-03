pkgname=("spl-hostid")
pkgver=0.1
pkgrel=1
pkgdesc="Maintains /etc/hostid for Solaris Porting Layer."
arch=("any")
source=()
groups=("archzfs")
license=("GPL")
install=spl-hostid.install
backup=("etc/hostid")
url="http://nothing.com"

package() {
  install -d $pkgdir/etc
  # 0xFFFFFFFF marks invalid hostid files. In the post_install script we
  # generate a proper hostid file. We don't do it here, to not pick up
  # and hardcode the hostid of the package build machine.
  echo -en "\xff\xff\xff\xff" > $pkgdir/etc/hostid
}

md5sums=()
