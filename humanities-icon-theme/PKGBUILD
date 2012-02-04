# Maintainer: Hannes Riehl <hannes.riehl at gmail dot com>

pkgname=humanities-icon-theme
pkgver=0.2
pkgrel=2
pkgdesc="A modified version of the Ubuntu Humanity Icon theme that allows you to easily change the icon colors."
arch=('any')
url="http://gnome-look.org/content/show.php/Humanity-Colors?content=117230/"
license=('GPL')
groups=('gnome')
depends=('ubuntu-mono')
optdepends=('magicons: customize icon color scheme')
source=('http://dl.dropbox.com/u/3588645/Themes/Humanities/Humanities.tar.bz2'
	'http://dl.dropbox.com/u/3588645/Themes/Humanities/Humanities-Dark.tar.bz2'
	'http://dl.dropbox.com/u/3588645/Themes/Humanities/Humanities-G.tar.bz2'
	'http://dl.dropbox.com/u/3588645/Themes/Humanities/Humanities-G-Dark.tar.bz2')
md5sums=('2afca04eced18eb7e441ac9a5664801f'
         'a039afd626a7f84d345b93fa0794e46e'
         '8d9a54c7e328161c0611ccf1be5041fb'
         'b7c0808c9bda90153d0f7d0a2c8c65ab')

build() {
  _dest=$pkgdir/usr/share
  _humanities=('Humanities'
	       'Humanities-Dark'
	       'Humanities-G'
	       'Humanities-G-Dark')
  mkdir -p $_dest/icons $_dest/magicons/iconsets
  cd $_dest
  for item in ${_humanities[*]}
  do
      ln -s /usr/share/icons/$item magicons/iconsets
      cp -Pr $srcdir/$item icons
  done
}

