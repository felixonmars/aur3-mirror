# Maintainer : Lenin Lee <lenin.lee (at) gmail (dot) com >
# Contributor: LUO, Jian <jian (dot) luo (dot) cn (at) gmail (dot) com >
#              Ivan Sichmann Freitas <ivansichfreitas (at) gmail (dot) com>

pkgname=python2-pyclewn
pkgver=1.11
pkgrel=1
pkgdesc="A python2 version of gdb support for vim"
license=('GPL2')
arch=(i686 x86_64)
url="http://pyclewn.wiki.sourceforge.net"
depends=('python2' 'gvim>=7.3' 'gdb')
install=vimdoc.install
source=(http://downloads.sourceforge.net/sourceforge/pyclewn/pyclewn-$pkgver/pyclewn-$pkgver.py2.tar.gz)
md5sums=('313a88e7ec2dd6595d0fd609b8f19c13')

build() {
  cd $srcdir/pyclewn-$pkgver.py2
  # fixing a duplicated marker in pyclewn.txt
  #sed -i 's/\*C\*//' runtime/doc/pyclewn.txt
  vimdir=/usr/share/vim/vim`vim --version|head -n 1|cut -f 5 -d ' ' | cut -c 1,3` python2 setup.py install --force --root=$pkgdir
  # removing tags to avoid conflict
  #rm $pkgdir/usr/share/vim/vim73/doc/tags
}
