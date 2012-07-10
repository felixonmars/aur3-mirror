post_install() {
	echo "***************************    IMPORTANT       ***************************************"
	echo "** Now ADD \"autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino\" to your .vimrc **"
	echo "**************************************************************************************"
}

post_remove() {
	echo "***************************       IMPORTANT       ***************************************"
	echo "** Now REMOVE \"autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino\" to your .vimrc **"
	echo "*****************************************************************************************"
}
