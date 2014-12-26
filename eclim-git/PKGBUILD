# Maintainer: Andrea Fagiani <andfagiani_at_gmail_dot_com>
# Contributor: Guillaume ALAUX <guillaume at alaux dot net>

pkgname=eclim-git
pkgver=2.4.0_191_gba69e71
pkgrel=2
pkgdesc="Brings Eclipse functionality to Vim"
url="http://eclim.org/"
license=('GPL3')
arch=(i686 x86_64)
depends=('vim' 'eclipse')
makedepends=('apache-ant' 'python2-sphinx')
optdepends=('eclipse-pdt: Eclipse PHP Development Tools support'
            'eclipse-cdt: Eclipse C/C++ Plugin support'
            'eclipse-dltk-core: Eclipse Dynamic Languagues Toolkit support'
            'eclipse-dltk-ruby: Eclipse Ruby support'
            'eclipse-wtp: Eclipse Web Developer Tools support')
conflicts=('eclim')
install=$pkgname.install
_authorgit=https://github.com/ervandew
source=("$pkgname::git+$_authorgit/eclim.git"
        systemd_eclimd.service)
sha256sums=('SKIP'
            '0d234125db21ace7cc1c0031c95bfc40d9093a6442bf3abeabd7b816371a8b14')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe | tr '-' '_'
}

prepare() {
  cd "$srcdir/$pkgname"

  sed -i 's|git@github.com:|https://github.com/|' .gitmodules
  git remote set-url origin $_authorgit/sphinx-bootstrap-theme.git
  git submodule update --init

  # fix build, thanks to mikezackles
  sed -e "s/'sphinx-build'/'sphinx-build2'/g" \
    -e 's|${user.home}/\.|${vim.files}/|g' \
    -e "s|File(getVariable('eclipse')|File('/usr/share/eclipse/'|g" \
    -i ant/build.gant

  # Get the ANT_HOME environment variable
  source /etc/profile.d/apache-ant.sh

  chmod +x org.eclim/nailgun/configure bin/sphinx
}

build() {
  cd "$srcdir/$pkgname"

  # recompiling nailgun to make sure the executable is compliant with our architecture
  cd org.eclim/nailgun
  ./configure
  make

  cd ../..

  mkdir -p ${srcdir}/build
  ant -Declipse.home=/usr/share/eclipse \
      -Declipse.dest=${srcdir}/build \
      -Dvim.files=/usr/share/vim/vimfiles \
      build
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p $pkgdir/usr/share/eclipse
  mkdir -p $pkgdir/usr/share/vim/vimfiles

  ant -Declipse.home=/usr/share/eclipse \
      -Declipse.dest=${srcdir}/build \
      -Dvim.files=$pkgdir/usr/share/vim/vimfiles \
      docs vimdocs

  ant -Declipse.home=$pkgdir/usr/share/eclipse \
      -Declipse.dest=${srcdir}/build \
      -Dvim.files=$pkgdir/usr/share/vim/vimfiles \
      deploy

  # copy eclim docs
  mkdir -p $pkgdir/usr/share/doc/
  cp -r build/doc/site $pkgdir/usr/share/doc/eclim

  cp -r ${srcdir}/build/features ${srcdir}/build/plugins \
    ${pkgdir}/usr/share/eclipse/

  # fix eclim paths
  sed -e "s|$pkgdir||g" \
    -i $pkgdir/usr/share/vim/vimfiles/eclim/plugin/eclim.vim \
    -i $pkgdir/usr/share/eclipse/plugins/org.eclim_*/bin/eclimd \
    -i $pkgdir/usr/share/eclipse/plugins/org.eclim_*/plugin.properties

  pushd $pkgdir/usr/share/eclipse/
    unlink $pkgdir/usr/share/eclipse/eclimd
    ln -s $(find . -type f -path *bin/eclimd -executable) eclimd
    unlink $pkgdir/usr/share/eclipse/eclim
    ln -s $(find . -type f -path *bin/eclim -executable) eclim
  popd

  # delete doctrees
  rm -fr $pkgdir/usr/share/doc/eclim/.doctrees

  # delete Windows stuff
  for i in $(find $pkgdir -regex ".*bat\|.*cmd\|.*exe"); do  rm -f $i ; done

  rm $pkgdir/usr/share/eclipse/plugins/org.eclim_*/nailgun/config.status

  install -D -m 644 ${srcdir}/systemd_eclimd.service ${pkgdir}/usr/lib/systemd/user/eclimd.service
}
