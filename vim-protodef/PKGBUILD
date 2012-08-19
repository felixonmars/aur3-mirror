# Maintainer: Chris Sakalis <chrissakalis at gmail.com>
# Contributor: Karl Kochs <captainhaggy at i2pmail dot org>
# Contributor: Laszlo Papp <djszapi @ gmail at com>
pkgname=vim-protodef
pkgver=0.9.5
_scriptid=14138
pkgrel=3
pkgdesc="Tool to help create skeleton implementations of C++ function prototypes."
arch=("any")
url="http://www.vim.org/scripts/script.php?script_id=2624"
license=('custom:vim')
depends=('vim' 'vim-fswitch' 'perl' 'ctags')
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}-${pkgver}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid}
        license.txt)

md5sums=('77f512d536b3d93107dbdb7ebd3d87e0'
         'e1c2dd9811225cf5b53d470995d05eeb')
sha256sums=('8d09036565ebf5fec04bca43bfc14dc960444ceca997814836d0ab84e7a0a396'
            'c8ae5c8653a7562c44d1c1c8367b8b4824da44b29398f6fd2db8f309667f8061')

package() {
    install -d ${pkgdir}/usr/share/vim/vimfiles/{doc,plugin}
    install -Dm644 ${srcdir}/${pkgname}/doc/protodef.txt ${pkgdir}/usr/share/vim/vimfiles/doc/protodef.txt
    install -Dm644 ${srcdir}/${pkgname}/plugin/protodef.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/protodef.vim
    install -Dm755 ${srcdir}/${pkgname}/pullproto.pl ${pkgdir}/usr/share/vim/pullproto.pl
    install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}

