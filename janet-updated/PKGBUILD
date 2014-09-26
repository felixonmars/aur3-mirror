# Maintainer: UserX <userx at archlinux dot info>  Scarlet <janaina.kaufmann at gmail dot com>
# based on PKGBUILD FROM Cody Lee <platinummonkey at archlinux dot us>


# The original PKGBUILD was out-of-date and with incorrect checksum.

pkgname=janet-updated
pkgver=0.2.4
pkgrel=1
pkgdesc="Project JaNET is a free open source framework that allows various hardware and softwares components to comunicate, controlled, interactively by the user"
arch=('i686' 'x86_64')
url="http://sites.google.com/site/projectjanet"
license=('CCPL:by-nc' 'GPL')
depends=('monodevelop' 'festival' 'simon')
makedepends=()
optdepends=('janet-addons: Additional plugins for jaNET'
	    'htk: For customizing simon')
install=
source=("http://sourceforge.net/projects/project-janet/files/Binaries/Bin.tar.gz")
md5sums=('098151037298e83e005923cb70da334a')

build() {
  cd $srcdir
}

package() {
  cd $srcdir
  sudo mkdir -p /usr/share/$pkgname/scripts
  sudo cp -R ./* /usr/share/$pkgname/.
  
  # create janet launcher script
  sudo cat <<EOF >>/usr/bin/$pkgname
#!/bin/sh
sudo /usr/bin/mono /usr/share/$pkgname/jaNET.exe "\$\@"
EOF
  sudo chmod a+x /usr/bin/$pkgname
  echo -e 'Take a look at the https://wiki.archlinux.org/index.php/JaNET, to see voice festival and simon settings'
}
