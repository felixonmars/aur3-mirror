# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contributors: 
#     * lemanyk <lemanyk@gmail.com>
#     * Florian Friesdorf <archlinux@chaoflow.net>
#     * Laszlo Papp <djszapi @ gmail at com>

pkgname=vim-pydiction
pkgver=1.2.3
_scriptid=21842
pkgrel=2
pkgdesc="Allows you to auto-complete your Python code"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=850"
license=('BSD')
groups=('vim-plugins')
depends=('vim' 'python2')
install='pydiction.install'
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})
md5sums=('e3c438ce3342fd1cf83733011ddc504e')

package() {
  cd ${srcdir}/pydiction

  install -Dm755 pydiction.py ${pkgdir}/usr/bin/pydiction.py
  install -Dm644 complete-dict ${pkgdir}/usr/share/pydiction/complete-dict
  install -Dm644 after/ftplugin/python_pydiction.vim ${pkgdir}/usr/share/vim/vimfiles/ftplugin/python_pydiction.vim
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.txt
}

