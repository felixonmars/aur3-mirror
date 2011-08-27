# Maintainer: Karl Kochs <captainhaggy at i2pmail dot org>
# Contributor: Florian Friesdorf <archlinux at chaoflow dot net>
pkgname=vim-vimoutliner
pkgver=0.3.4
pkgrel=4
pkgdesc="Vim Outliner - one of many"
arch=('any')
url="http://www.vimoutliner.org/"
license=('GPL')
groups=('vim-plugins')
depends=('vim')
optdepends=('python2: for /usr/bin/otl2html.py')
conflicts=('vimoutliner' 'vim-tvo')
install=vimdoc.install
source=(
  "http://archive.ubuntu.com/ubuntu/pool/universe/v/vimoutliner/vimoutliner_0.3.4+pristine.orig.tar.gz"
  install.sh
  ftdetect_vo_base.vim
  vimoutlinerrc
  )
md5sums=('66b69714be50a1f411830380a3e6bd5e'
         '40bf3647f9fc9d9c600f5a22cfe3d8ea'
         '9f59f4e104e5f5a79525565610a59b0f'
         '911183db87820b1a26b35b7ebab27e4b')

build() {
    cd ${srcdir}
    ./install.sh $pkgname $srcdir/vimoutliner-$pkgver $pkgdir

    install -Dm644 $srcdir/ftdetect_vo_base.vim \
        $pkgdir/usr/share/vim/vimfiles/ftdetect/vo_base.vim

    # the one provided in the tarball has a minor error
    install -Dm644 $srcdir/vimoutlinerrc \
        $pkgdir/usr/share/doc/vim-vimoutliner/vimoutlinerrc
}
