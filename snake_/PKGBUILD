# Maintainer: Andrea De Angelis (Dea1993) - andrea.deangelis93@gmail.com
# http://deasproject.altervista.org

pkgname=snake_
pkgver=0.5.1
pkgrel=1
pkgdesc="gioco snake"
arch=('i686' 'x86_64')
url="http://deasproject.altervista.org"
license=('')
depends=('python2' 'python2-pygame' 'python2-numpy')
source=(http://sourceforge.net/projects/snakepygame/files/snake_0.5.1.tar.gz/download)
md5sums=('5ce945c105565588057875ea82446713')

package() {
	mkdir $HOME/.SnakePygame
	cd "$srcdir/$pkgname$pkgver/"
	cp -r * $HOME/.SnakePygame
	chmod 777 $HOME/.SnakePygame/$pkgname$pkgver.py
	mv $HOME/.SnakePygame/snake_pygame.desktop $HOME/.local/share/applications/
	echo "Exec="$HOME/.SnakePygame/start_snake-archlinux.sh >> $HOME/.local/share/applications/snake_pygame.desktop
	echo "Icon="$HOME/.SnakePygame/Immagini/snake_pygame-icon.png >> $HOME/.local/share/applications/snake_pygame.desktop
	echo "Version="$pkgver >> $HOME/.local/share/applications/snake_pygame.desktop
}