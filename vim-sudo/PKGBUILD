# Maintainer : Bob Fanger < bfanger(at)gmail >

pkgname=vim-sudo
pkgver=2.0
pkgrel=5
pkgdesc="Adding the ability to read and write one file with root privileges without running vim as root (:w sudo:/etc/rc.conf)"
arch=(i686 x86_64)
license="unknown"
url="http://www.vim.org/scripts/script.php?script_id=729"
depends=(vim sudo)
groups=('vim-plugins')
source=(http://www.vim.org/scripts/download_script.php?src_id=3477)
md5sums=('5bc1ddb421172b616d1e8829fe063ffd')

package()
{
  cd "${srcdir}"
  install -D -m644 "download_script.php?src_id=3477" "$pkgdir/usr/share/vim/vimfiles/plugin/sudo.vim"
}

