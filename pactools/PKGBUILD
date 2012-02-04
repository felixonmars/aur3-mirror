#Contributor: Pierluigi <pierluigi88@gmail.com>

pkgname=pactools
pkgver=0.8.2
pkgrel=1
pkgdesc="A collection of the best tools for pacman"
arch=('i686' 'x86_64')
url="http://pierloz.com/pactools"
license=("GPL")
depends=('perl' 'bash' 'python')
source=(pactools pt-pacman-cage pt-pacman-uncage pt-pacsize \
pt-deptree pt-pacman-info pt-repolist pt-pacfix)

build() {
  install -d $pkgdir/usr/bin
  install -m 755 $srcdir/* $pkgdir/usr/bin
}
md5sums=('e04be158db59062fdb44a163d19d7cbf'
         '505cbc004c239a3a94b6f02c5c3201af'
         '592cf087a714a74e694b507383e9bef0'
         'f2377202783af3eca5390327fd83e3b7'
         'a7bdcab2cba14d2948eb125e82e496d3'
         '3eb6d5410650c8a508973f1add786266'
         'fa67e705aaf6f01d1708d3076b5431a4'
         'fe3422509815063180c211a14d9a3798')
