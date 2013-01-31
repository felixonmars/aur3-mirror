# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Maintainer: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Anastasia Khartikova <cppkhartna @ gmail . com>
pkgname=vim-dbext
pkgver=18.0
_scriptid=19052
pkgrel=1
pkgdesc="Provides database access to many DBMS (Oracle, Sybase, Microsoft, MySQL, DBI,..)"
arch=(i686 x86_64)
url="http://www.vim.org/scripts/script.php?script_id=356"
license=('GPL')
depends=(vim)
groups=('vim-plugins')
install=vimdoc.install
source=(${pkgname}.zip::http://www.vim.org/scripts/download_script.php?src_id=${_scriptid})

build() {
    mkdir -p $pkgdir/usr/share/vim/vimfiles
    rm $srcdir/doc/*.dat
    mv $srcdir/{autoload,plugin,doc} $pkgdir/usr/share/vim/vimfiles
}

md5sums=('5cd08ab52ec16372824abd4d5198dcfc')
