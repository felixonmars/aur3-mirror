# Contributor: Davorin Učakar <davorin.ucakar@gmail.com>
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=xcursor-fedora
pkgver=6.0
pkgrel=1
group=('fedora-artwork')
pkgdesc="Port of Fedora 6+ cursor theme (black and white versions)."
url="http://opendesktop.org/content/show.php/Fedora+Core+6+Cursors?content=50533"
arch=('any')
license=('GPL')
source=('http://opendesktop.org/CONTENT/content-files/50533-fedora%20core%206.tar.gz'
	'http://opendesktop.org/CONTENT/content-files/50534-fedora%20core%206%20inverse.tar.gz')

build() {
  cd $srcdir

  # We need to symlink missing cursors to prevent old&ugly built-in X11 cursors to
  # be used instead. Fedora, however, seems to have a hack in X11 to use left_ptr cursor
  # if the requested one is missing, but that's not the case on Arch.
  # The NeutralPlus theme was used to figure out which cursors are missing and to
  # choose the best alternatives, since it is IMHO the most complete X cursor theme
  # I've seen so far.
  for dir in $srcdir/{FedoraCore6,FedoraCore6-inverse}/cursors; do
    cd $dir
    ln -s     dotbox                  draped_box
    ln -s     dotbox                  icon
    ln -s     dotbox                  target
    ln -s     dotbox                  dot_box_mask
    ln -s     left_ptr_watch          3ecb610c1bf2410f44200f48c40d3599
    ln -s     dnd-move                4498f0e0c1937ffe01fd06f973665830
    ln -s     dnd-move                9081237383d90e509aa00f00170e968f
    ln -s     dnd-move                move
    ln -s     dnd-copy                1081e37283d90000800003c07f3ef6bf
    ln -s     dnd-copy                6407b0e94181790501fd1e167b474872
    ln -s     dnd-copy                copy
    ln -s     cross                   cross_reverse
    ln -s     cross                   diamond_cross
    ln -s     hand2                   9d800788f1b08800ae810202380a0822
    ln -s     hand2                   hand
    ln -s     hand2                   e29285e634086352946a0e7090d73106
    ln -s     question_arrow          d9ce0ab605698f320427677b458ad60b
    ln -s     question_arrow          help
    ln -s     question_arrow          left_ptr_help
    ln -s     dnd-link                3085a0e285430894940527032f8b26df
    ln -s     dnd-link                640fb0e74195791501fd1ed57b41487f
    ln -s     dnd-link                link
    ln -s     circle                  crossed_circle
    ln -s     circle                  03b6e0fcb3499374a867c041f52298f0
    ln -s     top_right_corner        fd_double_arrow
    ln -s     top_right_corner        fcf1c3c7cd4491d801f1e1c78f100000
    ln -s     top_left_corner         bd_double_arrow
    ln -s     top_left_corner         c7088f0f3e6c8088236ef8e1e3e70000
    ln -s     sb_h_double_arrow       h_double_arrow
    ln -s     sb_h_double_arrow       14fef782d02440884392942c11205230
    ln -s     sb_h_double_arrow       028006030e0e7ebffc7f7070c0600140
    ln -s     sb_v_double_arrow       base_arrow_up
    ln -s     sb_v_double_arrow       based_arrow_up
    ln -s     sb_v_double_arrow       based_arrow_down
    ln -s     sb_v_double_arrow       base_arrow_down
    ln -s     sb_v_double_arrow       v_double_arrow
    ln -s     sb_v_double_arrow       2870a09082c103050810ffdffffe0204
    ln -s     v_double_arrow          00008160000006810000408080010102
    ln -s     center_ptr              centre_ptr
    rm -f     _watch_old_
  done
}

package(){
  cd $srcdir
  mkdir -p $pkgdir/usr/share/icons
  cp -R $srcdir/{FedoraCore6,FedoraCore6-inverse} $pkgdir/usr/share/icons
}

md5sums=('91bd292f59585ac61509f3ba06a9f6c7'
         '57eafcd3af03b061576de7386f7beb83')
